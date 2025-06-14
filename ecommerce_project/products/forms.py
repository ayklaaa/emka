from django import forms
from .models import Product, Review, SizeOption


class ReviewForm(forms.ModelForm):
    class Meta:
        model = Review
        fields = ["rating", "comment"]
        widgets = {
            "rating": forms.Select(attrs={"class": "form-select"}),
            "comment": forms.Textarea(attrs={"class": "form-control", "rows": 3}),
        }
        labels = {
            "rating": "Рейтинг",
            "comment": "Комментарий"
        }


class ProductForm(forms.ModelForm):
    # Поле для выбора доступных размеров
    available_sizes = forms.MultipleChoiceField(
        choices=SizeOption.SIZE_CHOICES,
        widget=forms.CheckboxSelectMultiple,
        required=False,
        label="Доступные размеры"
    )

    class Meta:
        model = Product
        fields = ['name', 'description', 'price', 'discounted_price', 'is_discounted',
                  'image', 'category', 'tags', 'is_recommended', 'is_new']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Введите название товара'}),
            'description': forms.Textarea(
                attrs={'class': 'form-control', 'rows': 4, 'placeholder': 'Подробное описание товара'}),
            'price': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': '0,00'}),
            'discounted_price': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': '0,00'}),
            'image': forms.ClearableFileInput(attrs={'class': 'form-control'}),
            'category': forms.Select(attrs={'class': 'form-select'}),
            'tags': forms.SelectMultiple(attrs={'class': 'form-select'}),
            'is_discounted': forms.CheckboxInput(attrs={'class': 'form-check-input'}),
            'is_recommended': forms.CheckboxInput(attrs={'class': 'form-check-input'}),
            'is_new': forms.CheckboxInput(attrs={'class': 'form-check-input'}),
        }
        labels = {
            'name': 'Название товара',
            'description': 'Описание',
            'price': 'Цена',
            'discounted_price': 'Цена со скидкой',
            'is_discounted': 'Товар со скидкой',
            'image': 'Изображение',
            'category': 'Категория',
            'tags': 'Теги',
            'is_recommended': 'Рекомендованный товар',
            'is_new': 'Новый товар',
        }
        help_texts = {
            'discounted_price': 'Укажите цену со скидкой, если товар акционный',
            'tags': 'Выберите подходящие теги или оставьте пустым',
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance.pk:
            self.fields['available_sizes'].initial = [
                size.size for size in self.instance.sizes.all()
            ]

    def save(self, commit=True):
        product = super().save(commit=commit)

        # Очищаем текущие размеры продукта
        product.sizes.all().delete()

        # Добавляем новые размеры
        for size in self.cleaned_data.get('available_sizes', []):
            SizeOption.objects.create(product=product, size=size)

        return product