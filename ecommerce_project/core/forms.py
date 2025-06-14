from django import forms
from .models import Article

class ArticleForm(forms.ModelForm):
    class Meta:
        model = Article
        fields = ['title', 'image', 'content']
        widgets = {
            'content': forms.Textarea(attrs={'rows': 10}),
        }