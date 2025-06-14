from django.urls import path
from . import views

app_name = 'custom_admin'

urlpatterns = [
    path('', views.admin_dashboard, name='dashboard'),
    path('orders/', views.order_management, name='order_management'),
    path('users/', views.user_management, name='user_management'),
    path('reports/', views.generate_sales_report, name='sales_report'),
    path('orders/<int:order_id>/change/', views.order_change, name='orders_order_change'),
]