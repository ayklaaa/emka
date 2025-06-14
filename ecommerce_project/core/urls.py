from django.urls import path
from . import views
from .views import category_products, home, about, contact, discount_products

app_name = "core"

urlpatterns = [
    path('', views.home, name='home'),
    path('contact/', views.contact, name='contact'),
    path('discount/', views.discount_products, name='discount'),
    path('add-to-cart/<int:product_id>/', views.add_to_cart, name='add_to_cart'),
    path('category/<slug:category_slug>/', category_products, name='category_products'),

    path("about/", about, name="about"),
    path("contact/", contact, name="contact"),
]
