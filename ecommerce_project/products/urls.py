from django.urls import path
from . import views
from .views import (
    ProductListView,
    product_detail,
    add_review,
    wishlist_view,
    remove_from_wishlist,
    compare_view,
    compare_add,
    compare_remove,
    compare_clear,
    compare_count,
    compare_content,
    product_create,
    product_update,
    product_delete,
    product_detail,
    category_list,
)

app_name = "products"

# urls.py
urlpatterns = [
    # Пользовательская часть
    path('', views.ProductListView.as_view(), name='product_list'),
    path('product/<slug:slug>/', views.product_detail, name='product_detail'),
    path('products/', ProductListView.as_view(), name='product_list'),
    path('tag/<slug:slug>/', views.products_by_tag, name='tag'),
    path('search/', views.product_search, name='search_results'),
    path('category/<slug:slug>/', views.category_view, name='category'),
    path('categories/', views.category_list, name='category_list'),


    # Wishlist
    path("wishlist/", wishlist_view, name="wishlist"),
    path('add_to_wishlist/<int:product_id>/', views.add_to_wishlist, name='add_to_wishlist'),
    path("wishlist/remove/<int:product_id>/", remove_from_wishlist, name="remove_from_wishlist"),

    # Compare
    path('compare/', compare_view, name='compare'),
    path('compare/add/<int:product_id>/', compare_add, name='compare_add'),
    path('compare/remove/<int:product_id>/', compare_remove, name='compare_remove'),
    path('compare/clear/', compare_clear, name='compare_clear'),
    path('compare/count/', compare_count, name='compare_count'),
    path('compare/content/', compare_content, name='compare_content'),

    # Отзывы
    path('add-review/<int:product_id>/', views.add_review, name='add_review'),

    # Админская часть
    path('admin/create/', views.product_create, name='create'),
    path('admin/update/<int:pk>/', views.product_update, name='update'),
    path('admin/delete/<int:pk>/', views.product_delete, name='delete'),
    path('admin/list/', ProductListView.as_view(), name='list'),
]
