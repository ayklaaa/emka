from django.contrib.auth.decorators import login_required
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.db import transaction
from django.db.models import Sum
from django.http import JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from django.template.loader import render_to_string
from django.urls import reverse
from django.utils import timezone
import logging
import phonenumbers
from .models import Cart, CartItem, OrderItem, Order
from products.models import Product
from django.conf import settings
from django.core.mail import EmailMultiAlternatives

logger = logging.getLogger(__name__)


def validate_phone(number):
    """Валидация российского номера телефона"""
    try:
        parsed = phonenumbers.parse(number, "RU")
        return phonenumbers.is_valid_number(parsed)
    except phonenumbers.NumberParseException:
        return False


@login_required(login_url='/users/login/')
def add_to_cart(request, product_id):
    if request.method != 'POST':
        messages.error(request, "Неверный метод запроса")
        return redirect('products:product_list')

    try:
        product = get_object_or_404(Product, id=product_id)
        size = request.POST.get('size', '').strip()

        print(f"Добавление в корзину: product_id={product_id}, size='{size}'")
        print(f"POST данные: {request.POST}")
        print(f"Доступные размеры для товара: {list(product.sizes.values_list('size', flat=True))}")

        # Проверка размеров
        if product.sizes.exists():
            if not size:
                messages.error(request, "Пожалуйста, выберите размер")
                # Используем product.id вместо slug, если slug отсутствует
                if hasattr(product, 'slug') and product.slug:
                    return redirect('products:product_detail', slug=product.slug)
                else:
                    return redirect('products:product_detail', pk=product.id)

            try:
                product_size = product.sizes.get(size=size)
                if not product_size.in_stock:
                    messages.error(request, f"Размер {size} закончился")
                    if hasattr(product, 'slug') and product.slug:
                        return redirect('products:product_detail', slug=product.slug)
                    else:
                        return redirect('products:product_detail', pk=product.id)
            except product.sizes.model.DoesNotExist:
                messages.error(request, "Выбранный размер недоступен")
                if hasattr(product, 'slug') and product.slug:
                    return redirect('products:product_detail', slug=product.slug)
                else:
                    return redirect('products:product_detail', pk=product.id)

        print(f"Проверки пройдены, добавляем товар в корзину...")

        with transaction.atomic():
            cart, created = Cart.objects.get_or_create(user=request.user)
            print(f"Корзина {'создана' if created else 'найдена'}: {cart.id}")

            cart_item, item_created = CartItem.objects.get_or_create(
                cart=cart,
                product=product,
                size=size if product.sizes.exists() and size else None,
                defaults={'quantity': 1}
            )

            if not item_created:
                cart_item.quantity += 1
                cart_item.save()
                print(f"Количество товара увеличено до {cart_item.quantity}")
            else:
                print(f"Новый товар добавлен в корзину")

            size_text = f" (размер {size})" if size else ""
            messages.success(request, f'Товар "{product.name}"{size_text} добавлен в корзину')

            if hasattr(product, 'slug') and product.slug:
                return redirect('products:product_detail', slug=product.slug)
            else:
                return redirect('products:product_detail', pk=product.id)

    except Exception as e:
        print(f"Ошибка при добавлении в корзину: {str(e)}")
        import traceback
        traceback.print_exc()

        messages.error(request, "Произошла ошибка при добавлении товара в корзину")
        return redirect('products:product_list')

@login_required
def remove_from_cart(request, item_id):
    try:
        item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
        item.delete()
        messages.success(request, "Товар удален из корзины")
    except Exception as e:
        logger.error(f"Error removing from cart: {str(e)}")
        messages.error(request, "Ошибка при удалении товара")
    return redirect('orders:cart')


@login_required
def cart_view(request):
    try:
        cart = request.user.cart
        estimated_delivery = timezone.now() + timezone.timedelta(days=3)
        return render(request, 'orders/cart.html', {
            'cart': cart,
            'estimated_delivery_date': estimated_delivery.strftime("%d.%m.%Y"),
        })
    except Exception as e:
        logger.error(f"Cart view error: {str(e)}")
        messages.error(request, "Ошибка загрузки корзины")
        return redirect('products:product_list')


@login_required
@transaction.atomic
def checkout_view(request):
    if request.method == 'POST':
        try:
            with transaction.atomic():
                cart = request.user.cart
                if not cart.items.exists():
                    messages.error(request, "Ваша корзина пуста")
                    return redirect('orders:cart')
                # Создание заказа
                order = Order.objects.create(
                    user=request.user,
                    first_name=request.POST['full_name'].split()[0],
                    last_name=' '.join(request.POST['full_name'].split()[1:]),
                    email=request.POST.get('email', request.user.email),
                    phone=request.POST['phone_number'],
                    address=f"{request.POST['city']}, {request.POST['postal_code']}, {request.POST['address']}",
                    total_price=cart.total_price,
                    payment_method=request.POST['payment_method'],
                    delivery_method=request.POST.get('delivery_method', 'courier')
                )

                # Перенос товаров из корзины в заказ
                for cart_item in cart.items.all():
                    OrderItem.objects.create(
                        order=order,
                        product=cart_item.product,
                        quantity=cart_item.quantity,
                        price=cart_item.product.price,  # Сохраняем текущую цену товара
                        size=cart_item.size
                    )
                    print(f"Добавлен товар в заказ: {cart_item.product.name}")  # Отладочный вывод

                # Очистка корзины
                cart.items.all().delete()
                print(f"Заказ {order.id} создан, товаров: {order.order_items.count()}")  # Отладочный вывод

                # Отправка писем и редирект
                try:
                    send_order_confirmation(order, request)
                    request.session['order_email_sent'] = True
                except Exception as e:
                    logger.error(f"Ошибка отправки email: {str(e)}")
                    request.session['order_email_sent'] = False

                request.session['order_id'] = order.id
                return redirect('orders:order_success', order_id=order.id)

        except Exception as e:
            logger.error(f"Ошибка оформления заказа: {str(e)}", exc_info=True)
            messages.error(request, "Произошла ошибка при оформлении заказа")
            return redirect('orders:cart')

    return render(request, 'orders/checkout.html')


def send_order_confirmation(order, request):
    """Отправка уведомлений клиенту и администратору"""
    try:
        # 1. Письмо клиенту
        customer_subject = f'Заказ №{order.id} принят в обработку'
        customer_text = render_to_string('orders/emails/order_processing.txt', {'order': order})
        customer_html = render_to_string('orders/emails/order_processing.html', {'order': order})

        customer_email = EmailMultiAlternatives(
            subject=customer_subject,
            body=customer_text,
            from_email=settings.DEFAULT_FROM_EMAIL,
            to=[order.email]
        )
        customer_email.attach_alternative(customer_html, "text/html")
        customer_email.send()

        # 2. Письмо администратору (без ссылки на админку, если она не настроена)
        admin_subject = f'Новый заказ №{order.id} от {order.email}'
        admin_context = {'order': order}

        try:
            # Пробуем получить URL админки, если она настроена
            admin_url = request.build_absolute_uri(
                reverse('admin:orders_order_change', args=[order.id]))
            admin_context['admin_url'] = admin_url
        except:
            # Если админка не настроена, просто пропускаем ссылку
            pass

        admin_text = render_to_string('orders/emails/admin_notification.txt', admin_context)
        admin_html = render_to_string('orders/emails/admin_notification.html', admin_context)

        admin_email = EmailMultiAlternatives(
            subject=admin_subject,
            body=admin_text,
            from_email=settings.DEFAULT_FROM_EMAIL,
            to=[settings.ADMIN_EMAIL],
            reply_to=[order.email]
        )
        admin_email.attach_alternative(admin_html, "text/html")
        admin_email.send()

        logger.info(f"Письма успешно отправлены клиенту {order.email} и администратору")

    except Exception as e:
        logger.error(f"Ошибка отправки email: {str(e)}", exc_info=True)
        raise


@login_required
def order_success(request, order_id):
    try:
        order = get_object_or_404(Order, id=order_id, user=request.user)
        email_sent = request.session.pop('order_email_sent', False)

        return render(request, 'orders/order_success.html', {
            'order': order,
            'email_sent': email_sent
        })
    except Exception as e:
        logger.error(f"Order success view error: {str(e)}")
        messages.error(request, "Ошибка загрузки страницы заказа")
        return redirect('products:product_list')


@login_required
def my_orders(request):
    try:
        # Явно указываем related_name, который определили в моделях
        orders = Order.objects.filter(user=request.user) \
            .prefetch_related('order_items__product') \
            .order_by('-created_at')

        # Отладочный вывод
        print(f"Найдено заказов: {orders.count()}")
        for order in orders:
            print(f"Заказ #{order.id} содержит {order.order_items.count()} товаров")

        return render(request, 'orders/my_orders.html', {
            'orders': orders,
            'debug': True  # Для отладки в шаблоне
        })

    except Exception as e:
        logger.error(f"Ошибка загрузки заказов: {str(e)}", exc_info=True)
        messages.error(request, "Произошла ошибка при загрузке списка заказов")
        return redirect('products:product_list')


@login_required
def update_cart_item(request, item_id):
    try:
        item = get_object_or_404(CartItem, id=item_id, cart__user=request.user)
        if request.method == 'POST':
            quantity = int(request.POST.get('quantity', 1))
            if quantity > 0:
                item.quantity = quantity
                item.save()
                messages.success(request, "Количество обновлено")
            else:
                item.delete()
                messages.success(request, "Товар удален из корзины")
        return redirect('orders:cart')
    except Exception as e:
        logger.error(f"Update cart item error: {str(e)}")
        messages.error(request, "Ошибка обновления корзины")
        return redirect('orders:cart')


@login_required
def order_detail(request, order_id):
    order = get_object_or_404(Order, id=order_id, user=request.user)
    items = order.order_items.select_related('product')

    # Отладочный вывод
    print(f"Order ID: {order.id}")
    print(f"Items count: {items.count()}")
    for item in items:
        print(f"Item: {item.product.name}, Qty: {item.quantity}, Price: {item.price}")

    context = {
        'order': order,
        'items': items,
        'status_class': {
            'new': 'text-secondary',
            'processing': 'text-primary',
            'completed': 'text-success',
            'cancelled': 'text-danger'
        }.get(order.status, 'text-warning')
    }
    return render(request, 'orders/order_detail.html', context)

@login_required
def cancel_order(request, order_id):
    try:
        order = get_object_or_404(Order, id=order_id, user=request.user)

        if order.status == 'processing':
            order.status = 'cancelled'
            order.save()
            messages.success(request, 'Заказ успешно отменен')
        else:
            messages.error(request, 'Невозможно отменить этот заказ')

        return redirect('orders:order_detail', order_id=order.id)
    except Exception as e:
        logger.error(f"Cancel order error: {str(e)}")
        messages.error(request, "Ошибка отмены заказа")
        return redirect('orders:my_orders')


@login_required
def cart_clear(request):
    try:
        cart = get_object_or_404(Cart, user=request.user)
        cart.items.all().delete()
        messages.success(request, "Корзина очищена")
    except Exception as e:
        logger.error(f"Cart clear error: {str(e)}")
        messages.error(request, "Ошибка очистки корзины")
    return redirect('orders:cart')

@login_required
def update_cart(request):
    try:
        if request.method == "POST":
            cart = request.user.cart
            for item in cart.items.all():
                quantity = request.POST.get(f'quantity_{item.id}')
                if quantity:
                    item.quantity = int(quantity)
                    item.save()
            messages.success(request, "Корзина обновлена")
        return redirect('orders:cart')
    except Exception as e:
        logger.error(f"Update cart error: {str(e)}")
        messages.error(request, "Ошибка обновления корзины")
        return redirect('orders:cart')

@login_required
def order_list(request):
    try:
        orders = Order.objects.filter(user=request.user).order_by('-created_at')
        return render(request, 'orders/my_orders.html', {'orders': orders})
    except Exception as e:
        logger.error(f"Order list error: {str(e)}")
        messages.error(request, "Ошибка загрузки списка заказов")
        return redirect('products:product_list')

@login_required
def get_cart_count(request):
    try:
        cart = request.user.cart
        count = cart.items.aggregate(total=Sum('quantity'))['total'] or 0
        return JsonResponse({'count': count})
    except Exception as e:
        logger.error(f"Cart count error: {str(e)}")
        return JsonResponse({'count': 0})


