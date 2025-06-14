from django.contrib import admin
from django.utils.html import format_html
from .models import Article

@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'published_date', 'image_preview')
    list_filter = ('published_date', 'author')
    search_fields = ('title', 'content')
    readonly_fields = ('image_preview',)
    fieldsets = (
        ('Основная информация', {
            'fields': ('title', 'author', 'published_date')
        }),
        ('Содержание', {
            'fields': ('content',),
            'classes': ('wide',)
        }),
        ('Изображение', {
            'fields': ('image', 'image_preview'),
            'classes': ('collapse',)
        }),
    )

    def image_preview(self, obj):
        if obj.image:
            return format_html('<img src="{}" style="max-height: 100px; max-width: 100px;" />', obj.image.url)
        return "Нет изображения"
    image_preview.short_description = 'Превью'

    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        form.base_fields['author'].initial = request.user
        return form