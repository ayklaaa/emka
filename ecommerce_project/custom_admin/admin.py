from django.contrib import admin
from orders.models import Order, OrderItem
from users.models import User
from products.models import Product

if not admin.site.is_registered(Order):
    admin.site.register(Order)

if not admin.site.is_registered(OrderItem):
    admin.site.register(OrderItem)

if not admin.site.is_registered(Product):
    admin.site.register(Product)

if not admin.site.is_registered(User):
    admin.site.register(User)
