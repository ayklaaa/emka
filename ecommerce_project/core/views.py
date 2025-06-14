from django.utils import timezone
from django.shortcuts import render, get_object_or_404, redirect
from django.core.mail import EmailMessage
from django.contrib import messages
from django.conf import settings
from products.models import Product, Category
from django.core.paginator import Paginator
from django.urls import reverse
from django.http import HttpResponseRedirect
from datetime import timedelta
import logging

logger = logging.getLogger(__name__)


def home(request):
    try:
        categories = Category.objects.all()
        recommended_products = Product.objects.filter(is_recommended=True)[:8]
        new_products = Product.objects.filter(is_new=True)[:8]
        popular_products = Product.objects.filter(is_popular=True)[:8]  # Заменили is_featured на is_popular
        seasonal_products = Product.objects.filter(is_seasonal=True)[:8]

        context = {
            'categories': categories,
            'recommended_products': recommended_products,
            'new_products': new_products,
            'popular_products': popular_products,
            'seasonal_products': seasonal_products
        }
        return render(request, 'home.html', context)

    except Exception as e:
        logger.error(f"Error in home view: {str(e)}")
        messages.error(request, "Произошла ошибка при загрузке данных")
        return render(request, 'home.html', {})


def about(request):
    return render(request, "core/about.html")


def contact(request):
    if request.method == 'POST':
        name = request.POST.get('name', '').strip()
        email = request.POST.get('email', '').strip()
        message = request.POST.get('message', '').strip()
        subject = request.POST.get('subject', 'Сообщение с сайта').strip()

        # Валидация
        if not all([name, email, message]):
            messages.error(request, 'Все поля обязательны для заполнения')
            return redirect('core:contact')

        if not '@' in email:
            messages.error(request, 'Введите корректный email')
            return redirect('core:contact')

        # Форматирование сообщения
        body = f"""
        Имя: {name}
        Email: {email}
        Тема: {subject}

        Сообщение:
        {message}
        """

        try:
            # Используем EmailMessage для большей гибкости
            email = EmailMessage(
                subject=f"Сообщение с сайта: {subject}",
                body=body,
                from_email=settings.DEFAULT_FROM_EMAIL,
                to=[settings.ADMIN_EMAIL],
                reply_to=[email]
            )
            email.send(fail_silently=False)
            messages.success(request, 'Ваше сообщение отправлено! Мы свяжемся с вами в ближайшее время.')
        except Exception as e:
            messages.error(request, 'Произошла ошибка при отправке сообщения. Пожалуйста, попробуйте позже.')
            # Логирование ошибки
            logger.error(f"Ошибка отправки email: {str(e)}")

        return redirect('core:contact')

    return render(request, 'core/contact.html')


def category_products(request, category_slug):
    category = get_object_or_404(Category, slug=category_slug)
    products = Product.objects.filter(category=category)
    return render(request, 'category_products.html', {'category': category, 'products': products})


from django.utils.timezone import now

def discount_products(request):
    filter_param = request.GET.get('filter', '')
    products = Product.objects.filter(is_discounted=True, is_active=True)

    # Применяем фильтры
    if filter_param == 'new':
        month_ago = now() - timedelta(days=30)
        products = products.filter(created_at__gte=month_ago)
    elif filter_param == 'cheap':
        products = products.filter(discounted_price__lte=5000)
    elif filter_param == 'expensive':
        products = products.filter(discounted_price__gte=10000)
    elif filter_param == 'popular':
        products = products.order_by('-rating')

    # Пагинация
    paginator = Paginator(products, 12)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'page_obj': page_obj,
        'current_filter': filter_param,
        'available_filters': {
            'new': 'Новинки',
            'cheap': 'До 5000 руб.',
            'expensive': 'От 10000 руб.',
            'popular': 'Популярные'
        }
    }
    return render(request, 'core/discount.html', context)


def add_to_cart(request, product_id):
    product = get_object_or_404(Product, id=product_id)

    # Инициализируем корзину, если её нет
    if 'cart' not in request.session:
        request.session['cart'] = {}

    cart = request.session['cart']

    if str(product_id) in cart:
        cart[str(product_id)]['quantity'] += 1
    else:
        # Безопасное получение изображения
        image_url = None
        if hasattr(product, 'images') and product.images.exists():
            try:
                image_url = product.images.first().image.url
            except:
                image_url = None

        cart[str(product_id)] = {
            'name': product.name,
            'price': str(product.discounted_price if hasattr(product,
                                                             'is_discounted') and product.is_discounted else product.price),
            'quantity': 1,
            'image': image_url
        }

    request.session.modified = True

    # Более безопасный редирект
    redirect_url = request.META.get('HTTP_REFERER', reverse('core:home'))
    return HttpResponseRedirect(redirect_url)