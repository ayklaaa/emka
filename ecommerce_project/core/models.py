from django.db import models
from django.contrib.auth.models import AbstractUser, Group as AuthGroup, Permission
from django.utils.translation import gettext_lazy as _


class BaseUser(AbstractUser):
    """
    Абстрактная базовая модель пользователя для наследования
    """
    groups = models.ManyToManyField(
        AuthGroup,
        verbose_name=_('groups'),
        blank=True,
        related_name="%(app_label)s_%(class)s_related",
        related_query_name="%(app_label)s_%(class)s",
    )
    user_permissions = models.ManyToManyField(
        Permission,
        verbose_name=_('user permissions'),
        blank=True,
        related_name="%(app_label)s_%(class)s_related",
        related_query_name="%(app_label)s_%(class)s",
    )

    class Meta:
        abstract = True