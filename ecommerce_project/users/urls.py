from django.contrib.auth.views import LoginView
from django.urls import path
from . import views

app_name = 'users'

urlpatterns = [
    path('register/', views.register, name='register'),
    path('profile/', views.profile_view, name='profile'),
    path('profile/edit/', views.edit_profile_view, name='edit_profile'),
    path('rewards/', views.user_rewards, name='rewards'),
    path('login/', views.user_login_view, name='login'),
    path('custom_admin-login/', views.admin_login_view, name='admin_login'),
    path('logout/', views.logout_view, name='logout'),



]