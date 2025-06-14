from django import forms
from .models import Article
from django.utils import timezone  # Добавьте этот импорт

class ArticleForm(forms.ModelForm):
    published_date = forms.DateTimeField(required=False, widget=forms.DateTimeInput(
        attrs={
            'type': 'datetime-local',
            'value': timezone.now().strftime('%Y-%m-%dT%H:%M')
        }
    ))

    class Meta:
        model = Article
        fields = ['title', 'image', 'content', 'published_date']
        widgets = {
            'content': forms.Textarea(attrs={
                'rows': 10,
                'class': 'form-control'
            }),
        }
        labels = {
            'title': 'Заголовок статьи',
            'image': 'Изображение',
            'content': 'Содержание',
            'published_date': 'Дата публикации'
        }
