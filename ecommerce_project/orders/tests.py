from django.core import mail


def test_order_email(self):
    order = Order.objects.create(...)
    self.assertEqual(len(mail.outbox), 1)
    self.assertIn(order.email, mail.outbox[0].to)