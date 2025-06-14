from django.contrib.admin.views.decorators import staff_member_required
from django.core.exceptions import PermissionDenied
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from .models import Article
from .forms import ArticleForm

def blog(request):
    articles = Article.objects.all()
    return render(request, 'blog/blog.html', {'articles': articles})

def article_detail(request, article_id):
    article = get_object_or_404(Article, id=article_id)
    return render(request, 'blog/article_detail.html', {'article': article})

@login_required
@staff_member_required
@user_passes_test(lambda u: u.is_staff)
def create_article(request):
    if request.method == 'POST':
        form = ArticleForm(request.POST, request.FILES)
        if form.is_valid():
            article = form.save(commit=False)
            article.author = request.user
            if not article.published_date:
                article.published_date = timezone.now()  # Установить текущее время
            article.save()
            return redirect('blog:blog')
    else:
        form = ArticleForm()
    return render(request, 'blog/article_form.html', {'form': form})

@login_required
@staff_member_required
@user_passes_test(lambda u: u.is_staff)
def edit_article(request, article_id):
    article = get_object_or_404(Article, id=article_id)
    if request.method == 'POST':
        form = ArticleForm(request.POST, request.FILES, instance=article)
        if form.is_valid():
            article = form.save(commit=False)
            if not article.published_date:
                article.published_date = timezone.now()  # Установить текущее время
            article.save()
            return redirect('blog:blog')
    else:
        form = ArticleForm(instance=article)
    return render(request, 'blog/article_form.html', {'form': form, 'article': article})


@login_required
@staff_member_required
@user_passes_test(lambda u: u.is_staff)
def delete_article(request, article_id):
    article = get_object_or_404(Article, id=article_id)
    if request.method == 'POST':
        article.delete()
        return redirect('blog:blog')
    return render(request, 'blog/confirm_delete.html', {'article': article})

def staff_required(view_func):
    def wrapper(request, *args, **kwargs):
        if not request.user.is_staff:
            raise PermissionDenied
        return view_func(request, *args, **kwargs)
    return wrapper
