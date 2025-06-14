from django.contrib import admin
from .models import Category, Tag, Product, SizeOption, ProductImage, Review, Wishlist, Compare


class SizeOptionInline(admin.TabularInline):
    model = SizeOption
    extra = 1


class ProductImageInline(admin.TabularInline):
    model = ProductImage
    extra = 1


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    inlines = [SizeOptionInline, ProductImageInline]
    list_display = ('name', 'price', 'stock', 'is_discounted', 'is_recommended')
    list_filter = ('is_discounted', 'is_recommended', 'is_new', 'is_seasonal', 'is_active')
    search_fields = ('name', 'description')
    prepopulated_fields = {'slug': ('name',)}


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    prepopulated_fields = {'slug': ('name',)}


@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ('product', 'user', 'rating', 'created_at')
    search_fields = ['product__name', 'user__username']


@admin.register(Wishlist)
class WishlistAdmin(admin.ModelAdmin):
    list_display = ('user', 'product', 'added_at')


@admin.register(Compare)
class CompareAdmin(admin.ModelAdmin):
    list_display = ('user', 'product', 'session_key')


