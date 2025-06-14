from datetime import date
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.db.models import Sum, Avg
from .forms import UserRegisterForm, ProfileEditForm
from .models import Reward, UserReward
from orders.models import Order
from django.contrib.auth import authenticate, login, logout


def register(request):
    if request.method == "POST":
        form = UserRegisterForm(request.POST, request.FILES)
        if form.is_valid():
            user = form.save(commit=False)
            user.role = 'user'


            birth_date = form.cleaned_data.get('birth_date')
            if birth_date and birth_date > date.today():
                form.add_error('birth_date', "Birth date cannot be in the future")
                return render(request, "users/register.html", {"form": form})

            user.save()
            user.backend = 'django.contrib.auth.backends.ModelBackend'
            login(request, user)
            return redirect("users:profile")
    else:
        form = UserRegisterForm()
    return render(request, "users/register.html", {"form": form})



@login_required
def profile_view(request):
    user = request.user
    recent_orders = Order.objects.filter(user=user).order_by('-created_at')[:5]
    total_orders = Order.objects.filter(user=user).count()
    completed_orders = Order.objects.filter(user=user, status='completed').count()
    pending_orders = Order.objects.filter(user=user, status='pending').count()
    total_spent = Order.objects.filter(user=user, status='completed').aggregate(total=Sum('total_price'))['total'] or 0

    # Check for new rewards whenever profile is viewed
    check_and_award_rewards(user)

    return render(request, 'users/profile.html', {
        'user': user,
        'recent_orders': recent_orders,
        'total_orders': total_orders,
        'completed_orders': completed_orders,
        'pending_orders': pending_orders,
        'total_spent': total_spent,
    })


@login_required
def edit_profile_view(request):
    if request.method == 'POST':
        form = ProfileEditForm(request.POST, request.FILES, instance=request.user)
        if form.is_valid():
            form.save()
            return redirect('users:profile')
    else:
        form = ProfileEditForm(instance=request.user)

    return render(request, 'users/edit_profile.html', {'form': form})


@login_required
def user_rewards(request):
    user_orders = Order.objects.filter(user=request.user, status="completed")
    total_orders = user_orders.count()
    total_spent = user_orders.aggregate(Sum("total_price"))["total_price__sum"] or 0
    avg_order = user_orders.aggregate(Avg("total_price"))["total_price__avg"] or 0

    rewards = []
    for reward in Reward.objects.all():
        earned = UserReward.objects.filter(user=request.user, reward=reward).exists()
        rewards.append({
            'reward': reward,  # Pass the whole reward object for more flexibility
            'earned': earned
        })

    return render(request, "users/rewards.html", {
        "rewards": rewards,
        "total_orders": total_orders,
        "total_spent": total_spent,
        "avg_order": round(avg_order, 2),
    })


def check_and_award_rewards(user):
    """Check if user qualifies for any new rewards and award them"""
    user_orders = Order.objects.filter(user=user, status="completed")
    total_orders = user_orders.count()
    total_spent = user_orders.aggregate(Sum("total_price"))["total_price__sum"] or 0
    avg_order = user_orders.aggregate(Avg("total_price"))["total_price__avg"] or 0

    for reward in Reward.objects.all():
        if not UserReward.objects.filter(user=user, reward=reward).exists():
            if (reward.type == "orders" and total_orders >= reward.threshold) or \
               (reward.type == "spent" and total_spent >= reward.threshold) or \
               (reward.type == "average" and avg_order >= reward.threshold):
                UserReward.objects.create(user=user, reward=reward)


def user_login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)

        if user is not None and user.role == 'user':
            login(request, user)
            return redirect('users:profile')
        else:
            return render(request, 'users/login.html', {'form': None, 'error': True})

    return render(request, 'users/login.html', {'form': None})

def admin_login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        secret_code = request.POST['secret_code']

        user = authenticate(request, username=username, password=password)

        if user is not None and user.role == 'custom_admin' and secret_code == 'SECRET123':  # Замени на свою проверку
            login(request, user)
            return redirect('/custom_admin-dashboard/')  # куда переходит админ
        else:
            from django.contrib import messages
            messages.error(request, "Неверные данные или нет доступа")
            return redirect('users:admin_login')

    return render(request, 'users/login.html')


def logout_view(request):
    logout(request)
    return redirect('core:home')