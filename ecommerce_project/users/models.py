from django.contrib.auth.models import AbstractUser
from django.db import models
from core.models import BaseUser
from django.contrib.auth.models import AbstractUser, Group as AuthGroup, Permission

class User(AbstractUser):
    ROLES = (
        ('custom_admin', 'Администратор'),
        ('user', 'Пользователь'),
        ('guest', 'Гость'),
    )

    role = models.CharField(max_length=20, choices=ROLES, default='user')
    phone = models.CharField(max_length=20, blank=True, null=True, verbose_name="Телефон")
    address = models.TextField(blank=True, null=True)
    birth_date = models.DateField(null=True, blank=True)
    avatar = models.ImageField(upload_to='avatars/', null=True, blank=True)
    secret_code = models.CharField(max_length=100, blank=True, null=True)
    is_admin = models.BooleanField(default=False)

    groups = models.ManyToManyField(
        AuthGroup,
        verbose_name='groups',
        blank=True,
        related_name="custom_user_set",
        related_query_name="custom_user",
    )
    user_permissions = models.ManyToManyField(
        Permission,
        verbose_name='user permissions',
        blank=True,
        related_name="custom_user_set",
        related_query_name="custom_user",
    )

    def __str__(self):
        return f"{self.username} ({self.get_role_display()})"

    class Meta:
        verbose_name = "Пользователь"
        verbose_name_plural = "Пользователи"

class Reward(models.Model):
    """Модель для хранения достижений пользователей."""
    name = models.CharField(max_length=255, unique=True, verbose_name="Название")
    description = models.TextField(verbose_name="Описание")
    threshold = models.IntegerField(verbose_name="Порог получения")
    type = models.CharField(
        max_length=50,
        choices=[
            ("orders", "Количество заказов"),
            ("spent", "Потраченная сумма"),
            ("average", "Средний чек"),
        ],
        verbose_name="Тип достижения",
    )

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Достижение"
        verbose_name_plural = "Достижения"


class UserReward(models.Model):
    """Модель для привязки достижений к пользователю."""
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="rewards")
    reward = models.ForeignKey(Reward, on_delete=models.CASCADE, related_name="users")
    date_earned = models.DateTimeField(auto_now_add=True, verbose_name="Дата получения")

    def __str__(self):
        return f"{self.user.username} - {self.reward.name}"

    class Meta:
        verbose_name = "Полученное достижение"
        verbose_name_plural = "Полученные достижения"
        unique_together = ("user", "reward")
