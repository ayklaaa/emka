from django.db import models
from orders.models import Order
from django.conf import settings

class OrderStatusLog(models.Model):
    """Лог изменений статусов заказов"""
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    old_status = models.CharField(max_length=20)
    new_status = models.CharField(max_length=20)
    changed_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True
    )
    changed_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Лог статуса заказа"
        verbose_name_plural = "Логи статусов заказов"

    def __str__(self):
        return f"Статус заказа {self.order.id} изменён на {self.new_status}"