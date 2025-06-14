from datetime import datetime, timezone
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import user_passes_test
from django.core.paginator import Paginator
from django.views.generic import ListView, DetailView
from django.db.models import Avg, Q, Count
from .forms import ReviewForm, ProductForm
from .models import Product, Category, Wishlist, Review, SizeOption, Compare
from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404
from django.http import JsonResponse
from .models import Product, Compare
from .utils import get_compare_owner
from django.utils import timezone
from django.views.decorators.http import require_http_methods
from django.db import models
from .models import Tag

class ProductListView(ListView):
    model = Product
    template_name = "products/product_list.html"
    context_object_name = "products"
    paginate_by = 10

    def get_queryset(self):
        queryset = super().get_queryset().filter(is_active=True)

        search_query = self.request.GET.get("q")
        category_slug = self.request.GET.get("category")
        min_price = self.request.GET.get("min_price")
        max_price = self.request.GET.get("max_price")

        if search_query:
            queryset = queryset.filter(
                Q(name__icontains=search_query) | Q(description__icontains=search_query)
            )

        if category_slug:
            queryset = queryset.filter(category__slug=category_slug)

        if min_price:
            queryset = queryset.filter(price__gte=min_price)

        if max_price:
            queryset = queryset.filter(price__lte=max_price)

        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        categories = Category.objects.all()
        context["categories"] = categories

        # Используем is_recommended вместо is_featured
        recommended = Product.objects.filter(is_recommended=True).order_by('?')[:4]
        context["recommended_products"] = recommended

        return context
def products_by_tag(request, slug):
    tag = get_object_or_404(Tag, slug=slug)
    products = Product.objects.filter(tags=tag).order_by('-created_at')

    context = {
        'tag': tag,
        'products': products,
    }

    return render(request, 'products/products_by_tag.html', context)


def wishlist_view(request):
    if request.user.is_authenticated:
        wishlist_items = Wishlist.objects.filter(user=request.user).select_related("product")
        products = [item.product for item in wishlist_items]
    else:
        # Для неавторизованных пользователей
        wishlist_ids = request.session.get('wishlist', [])
        products = Product.objects.filter(id__in=wishlist_ids)

    return render(request, "products/wishlist.html", {"products": products})


@login_required
def add_to_wishlist(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    if request.method == "POST":
        if request.user.is_authenticated:
            wishlist, created = Wishlist.objects.get_or_create(user=request.user, product=product)
            if not created:  # Если уже было в избранном - удаляем
                wishlist.delete()
                status = 'removed'
            else:
                status = 'added'

            return JsonResponse({'status': status})

    return JsonResponse({'status': 'error'}, status=400)

def remove_from_wishlist(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    if request.user.is_authenticated:
        Wishlist.objects.filter(user=request.user, product=product).delete()
    else:
        wishlist = request.session.get('wishlist', [])
        if product_id in wishlist:
            wishlist.remove(product_id)
            request.session['wishlist'] = wishlist
    return redirect("products:wishlist")


def home(request):
    categories = Category.objects.all()
    recommended_products = Product.objects.filter(is_recommended=True)
    new_products = Product.objects.filter(created_at__gte=timezone.make_aware(datetime(2025, 1, 1)))
    popular_products = Product.objects.filter(is_popular=True)
    seasonal_products = Product.objects.filter(is_seasonal=True)

    context = {
        'categories': categories,
        'recommended_products': recommended_products,
        'new_products': new_products,
        'popular_products': popular_products,
        'seasonal_products': seasonal_products,
    }
    return render(request, 'home.html', context)


def category_view(request, slug):
    category = get_object_or_404(Category, slug=slug)
    product_list = Product.objects.filter(category=category)
    paginator = Paginator(product_list, 12)  # 12 товаров на страницу
    page = request.GET.get('page')
    products = paginator.get_page(page)
    return render(request, 'products/category.html', {'category': category, 'products': products})


def product_search(request):
    query = request.GET.get('q', '')
    category = request.GET.get('category', '')
    price_min = request.GET.get('min_price')
    price_max = request.GET.get('max_price')

    products = Product.objects.all()

    if query:
        products = products.filter(name__icontains=query)

    if category:
        products = products.filter(category__slug=category)

    if price_min:
        try:
            price_min_val = float(price_min)
            products = products.filter(price__gte=price_min_val)
        except ValueError:
            pass

    if price_max:
        try:
            price_max_val = float(price_max)
            products = products.filter(price__lte=price_max_val)
        except ValueError:
            pass

    context = {
        'products': products,
        'query': query,
    }

    return render(request, 'products/search_results.html', context)

def compare_view(request):
    filters = get_compare_owner(request)
    compare_items = Compare.objects.filter(**filters).select_related('product')
    products = [item.product for item in compare_items]
    return render(request, 'products/compare.html', {'products': products})


def compare_add(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    filters = get_compare_owner(request)

    if request.method == "POST":
        # Проверяем лимит сравнения
        compare_count = Compare.objects.filter(**filters).count()
        if compare_count >= 4:
            return JsonResponse({
                'status': 'limit',
                'message': 'Максимальное количество товаров для сравнения - 4'
            })

        # Проверяем, не добавлен ли уже товар
        if Compare.objects.filter(**filters, product=product).exists():
            return JsonResponse({
                'status': 'exists',
                'message': 'Этот товар уже в списке сравнения'
            })

        # Проверяем категорию
        existing_products = Compare.objects.filter(**filters).select_related('product')
        if existing_products.exists():
            first_category = existing_products.first().product.category
            if product.category != first_category:
                return JsonResponse({
                    'status': 'error',
                    'message': 'Можно сравнивать только товары из одной категории'
                })

        # Добавляем товар в сравнение
        Compare.objects.create(product=product, **filters)
        return JsonResponse({
            'status': 'added',
            'count': compare_count + 1
        })

    return JsonResponse({'status': 'error'}, status=400)


def compare_remove(request, product_id):
    product = get_object_or_404(Product, id=product_id)
    filters = get_compare_owner(request)
    Compare.objects.filter(product=product, **filters).delete()
    return JsonResponse({'status': 'removed'})


def compare_clear(request):
    filters = get_compare_owner(request)
    Compare.objects.filter(**filters).delete()
    return JsonResponse({'status': 'cleared'})


def compare_count(request):
    filters = get_compare_owner(request)
    count = Compare.objects.filter(**filters).count()
    return JsonResponse({'count': count})


def compare_content(request):
    filters = get_compare_owner(request)
    compare_items = Compare.objects.filter(**filters).select_related('product')
    products = [item.product for item in compare_items]
    return render(request, 'products/compare_content.html', {'products': products})


def is_admin(user):
    return user.is_authenticated and user.is_staff


@user_passes_test(is_admin)
def product_create(request):
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('products:list')
    else:
        form = ProductForm()
    return render(request, 'products/admin/product_form.html', {'form': form})


@user_passes_test(is_admin)
def product_update(request, pk):
    product = get_object_or_404(Product, pk=pk)
    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            return redirect('products:list')
    else:
        form = ProductForm(instance=product)
    return render(request, 'products/admin/product_form.html', {'form': form})


@user_passes_test(is_admin)
def product_delete(request, pk):
    product = get_object_or_404(Product, pk=pk)
    if request.method == 'POST':
        product.delete()
        return redirect('products:list')
    return render(request, 'products/admin/product_confirm_delete.html', {'product': product})


def product_list(request):
    products = Product.objects.filter(is_active=True)
    return render(request, 'products/product_list.html', {'products': products})

def category_list(request):
    categories = Category.objects.all()
    return render(request, 'products/category_list.html', {'categories': categories})


# Добавление отзыва
@login_required
def add_review(request, product_id):
    product = get_object_or_404(Product, id=product_id)

    if request.method == 'POST':
        rating = request.POST.get('rating')
        comment = request.POST.get('comment')

        if rating and comment:
            Review.objects.create(
                product=product,
                user=request.user,
                rating=rating,
                comment=comment
            )
            messages.success(request, 'Ваш отзыв добавлен')
        else:
            messages.error(request, 'Заполните все поля')

    return redirect('products:product_detail', slug=product.slug)


# Страница товара
def product_detail(request, slug):
    product = get_object_or_404(
        Product.objects.select_related('category')
        .prefetch_related('images', 'sizes', 'reviews__user'),
        slug=slug,
        is_active=True
    )

    return render(request, 'products/product_detail.html', {
        'product': product,
        'reviews': product.reviews.all()
    })


def cart_add(request, product_id):
    if request.method == 'POST':
        product = get_object_or_404(Product, pk=product_id)

        size = request.POST.get('size')
        if not size:
            messages.error(request, "Пожалуйста, выберите размер.")
            return redirect(product.get_absolute_url())

        # Проверим, что выбранный размер существует и доступен для продукта
        size_option = product.sizes.filter(size=size, in_stock=True).first()
        if not size_option:
            messages.error(request, "Выбранный размер недоступен.")
            return redirect(product.get_absolute_url())

        # Добавление товара в корзину, учитывая выбранный размер
        cart = request.session.get('cart', {})

        key = f"{product_id}_{size}"
        cart[key] = cart.get(key, 0) + 1

        request.session['cart'] = cart
        messages.success(request, f"Товар '{product.name}', размер {size} добавлен в корзину")
        return redirect('cart:detail')

    return redirect('product_detail', pk=product_id)