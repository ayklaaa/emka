from django import forms
from .models import Order
from django.core.validators import validate_email


class OrderForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = ["first_name", "last_name", "phone", "email", "address", "delivery_method", "payment_method"]
        widgets = {
            "delivery_method": forms.Select(attrs={"class": "form-select"}),
            "payment_method": forms.Select(attrs={"class": "form-select"}),
        }

class CheckoutForm(forms.ModelForm):
    class Meta:
        model = Order
        fields = [
            'first_name', 'last_name', 'phone', 'email',
            'address', 'delivery_method', 'payment_method', 'comment'
        ]
        widgets = {
            'comment': forms.Textarea(attrs={'rows': 3}),
        }
        email = forms.EmailField(validators=[validate_email], widget=forms.EmailInput(attrs={'placeholder': 'your@email.com'})),