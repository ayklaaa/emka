from django.conf import settings
from ckeditor_uploader.fields import RichTextUploadingField
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone


class Article(models.Model):
    title = models.CharField(max_length=200, verbose_name="Заголовок")
    image = models.ImageField(upload_to='blog/articles/', verbose_name="Изображение")
    image_caption = models.CharField(max_length=200, blank=True, verbose_name="Подпись к изображению")
    content = RichTextUploadingField(verbose_name="Содержание")
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT, verbose_name="Автор")
    published_date = models.DateTimeField(default=timezone.now, verbose_name="Дата публикации")
    is_published = models.BooleanField(default=True, verbose_name="Опубликовано")

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "Статья"
        verbose_name_plural = "Статьи"
        ordering = ['-published_date']
        permissions = [
            ("can_publish", "Может публиковать статьи"),
            ("can_edit_all", "Может редактировать все статьи"),
        ]