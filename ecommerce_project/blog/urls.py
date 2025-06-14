from django.urls import path
from .views import blog, article_detail, create_article, edit_article, delete_article
from django.contrib.auth.decorators import login_required, user_passes_test

app_name = 'blog'

urlpatterns = [
    path('', blog, name='blog'),
    path('article/<int:article_id>/', article_detail, name='article_detail'),
    path('create/', user_passes_test(lambda u: u.is_staff)(create_article), name='create_article'),
    path('edit/<int:article_id>/', user_passes_test(lambda u: u.is_staff)(edit_article), name='edit_article'),
    path('delete/<int:article_id>/', user_passes_test(lambda u: u.is_staff)(delete_article), name='delete_article'),
]