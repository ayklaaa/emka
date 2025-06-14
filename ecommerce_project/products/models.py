from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.db import models
from django.utils.text import slugify
from django.core.validators import FileExtensionValidator
from django.conf import settings
from django.utils.text import slugify
from django.urls import reverse
from django.core.exceptions import ValidationError

class Category(models.Model):
    name = models.CharField(max_length=100)
    slug = models.SlugField(unique=True)

    def save(self, *args, **kwargs):
        if not self.slug:
            self.slug = slugify(self.name)
        super().save(*args, **kwargs)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Категория"
        verbose_name_plural = "Категории"


class Tag(models.Model):
    name = models.CharField(max_length=50, unique=True)
    slug = models.SlugField(max_length=50, unique=True)

    def __str__(self):
        return self.name



def validate_image_size(image):
    if image.size > 5 * 1024 * 1024:
        raise ValidationError("Размер изображения не должен превышать 5MB!")

class Product(models.Model):
    name = models.CharField(max_length=255, verbose_name="Название товара")
    slug = models.SlugField(unique=True, blank=True, verbose_name="URL")
    description = models.TextField(verbose_name="Описание")
    price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name="Цена")
    discounted_price = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    is_discounted = models.BooleanField(default=False)
    stock = models.PositiveIntegerField(default=0)
    image = models.ImageField(upload_to='products/images/', validators=[validate_image_size], blank=True, null=True)
    category = models.ForeignKey('Category', on_delete=models.CASCADE, related_name='products', verbose_name="Категория")
    tags = models.ManyToManyField('Tag', blank=True, related_name='products', verbose_name="Теги")
    brand = models.CharField('Brand', max_length=255, blank=True, null=True)
    rating = models.DecimalField(max_digits=3, decimal_places=1, default=0.0, null=True, blank=True, verbose_name="Рейтинг")
    seasonal_tag = models.CharField(max_length=50, blank=True, null=True, verbose_name="Сезон")
    is_recommended = models.BooleanField(default=False, verbose_name="Рекомендованный товар")
    is_new = models.BooleanField(default=False)
    is_seasonal = models.BooleanField(default=False)
    is_popular = models.BooleanField(default=False)
    is_featured = models.BooleanField(default=False, verbose_name="Рекомендуемый товар")
    created_at = models.DateTimeField(auto_now_add=True)
    is_active = models.BooleanField(default=True, verbose_name="Активный товар")
    description = models.TextField()

    def save(self, *args, **kwargs):
        if not self.slug:
            base_slug = slugify(self.name)
            slug = base_slug
            counter = 1
            while Product.objects.filter(slug=slug).exists():
                slug = f"{base_slug}-{counter}"
                counter += 1
            self.slug = slug
        super().save(*args, **kwargs)

    @property
    def has_sizes(self):
        return self.sizes.exists()

    def get_absolute_url(self):
        return reverse('products:product_detail', kwargs={'slug': self.slug})

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['-created_at']
        verbose_name = "Товар"
        verbose_name_plural = "Товары"

    def get_discount_percentage(self):
        if self.is_discounted and self.discounted_price and self.price:
            return int(100 - (self.discounted_price * 100 / self.price))
        return 0

    def get_absolute_url(self):
        return reverse('products:product_detail', kwargs={'slug': self.slug})

    def get_recommended_products(self, limit=4):
        """Возвращает рекомендованные товары из той же категории"""
        return Product.objects.filter(
            category=self.category,
            is_recommended=True,
            is_active=True
        ).exclude(id=self.id).order_by('?')[:limit]  # случайные товары

    def update_rating(self):
        """Обновляет средний рейтинг товара на основе отзывов"""
        from django.db.models import Avg
        result = self.reviews.aggregate(Avg('rating'))
        self.rating = result['rating__avg']
        self.save()

    @property
    def is_featured(self):
        """Совместимость со старым кодом"""
        return self.is_popular

def validate_image_size(image):
    file_size = image.size
    max_size = 5 * 1024 * 1024
    if file_size > max_size:
        raise ValidationError("Размер изображения не должен превышать 5MB!")


class SizeOption(models.Model):
    SIZE_CHOICES = [
        ('30', '30'),
        ('32', '32'),
        ('34', '34'),
        ('36', '36'),
        ('37', '37'),
        ('38', '38'),
        ('39', '39'),
        ('40', '40'),
        ('42', '42'),
        ('44', '44'),
        ('46', '46'),
        ('48', '48'),
    ]

    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name='sizes')
    size = models.CharField(
        max_length=10,
        choices=SIZE_CHOICES,
        verbose_name="Размер"
    )
    # Добавляем поле для отслеживания наличия
    in_stock = models.BooleanField(default=True, verbose_name="В наличии")
    # Можно также добавить количество для каждого размера
    stock_quantity = models.PositiveIntegerField(default=0, verbose_name="Количество на складе")

    class Meta:
        unique_together = ('product', 'size')
        verbose_name = "Доступный размер"
        verbose_name_plural = "Доступные размеры"

    def __str__(self):
        stock_status = "В наличии" if self.in_stock else "Нет в наличии"
        return f"{self.product.name} - {self.size} ({stock_status})"

    @property
    def is_available(self):
        """Проверяет доступность размера"""
        return self.in_stock and self.stock_quantity > 0



class ProductImage(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE, related_name="images")
    image = models.ImageField(upload_to="product_images/", validators=[validate_image_size])

    def __str__(self):
        return f"Изображение для {self.product.name}"



class Review(models.Model):
    product = models.ForeignKey("Product", on_delete=models.CASCADE, related_name="reviews", verbose_name="Товар")
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    rating = models.PositiveIntegerField(choices=[(i, i) for i in range(1, 6)], verbose_name="Оценка")
    comment = models.TextField(verbose_name="Комментарий")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Дата добавления")

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.user.username} – {self.product.name} ({self.rating}⭐)"


class Wishlist(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    product = models.ForeignKey("Product", on_delete=models.CASCADE, related_name="wishlist_items",
                                verbose_name="Товар")
    added_at = models.DateTimeField(auto_now_add=True, verbose_name="Добавлено")

    class Meta:
        unique_together = ("user", "product")

    def __str__(self):
        return f"{self.user.username} -> {self.product.name}"





class Compare(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, null=True, blank=True)
    session_key = models.CharField(max_length=40, null=True, blank=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)

    class Meta:
        unique_together = (
            ('user', 'product'),
            ('session_key', 'product'),
        )
        verbose_name = 'Сравнение'
        verbose_name_plural = 'Сравнения'

    def __str__(self):
        return f"{self.user or self.session_key} — {self.product}"
