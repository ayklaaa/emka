from django.urls import path
from . import views

app_name = "orders"

urlpatterns = [
    # Корзина
    path('cart/', views.cart_view, name='cart'),
    path('add-to-cart/<int:product_id>/', views.add_to_cart, name='add_to_cart'),
    path('cart/remove/<int:item_id>/', views.remove_from_cart, name='remove_from_cart'),
    path('cart/clear/', views.cart_clear, name='cart_clear'),
    path('cart/update/', views.update_cart, name='update_cart'),

    # Оформление заказа
    path('checkout/', views.checkout_view, name='checkout'),
    path('checkout/success/<int:order_id>/', views.order_success, name='order_success'),

    # Заказы
    path('orders/', views.order_list, name='order_list'),
    path('orders/my/', views.my_orders, name='my_orders'),
    path('orders/<int:order_id>/', views.order_detail, name='order_detail'),
    path('orders/<int:order_id>/cancel/', views.cancel_order, name='cancel_order'),

    # API
    path('api/cart/count/', views.get_cart_count, name='get_cart_count'),
]
