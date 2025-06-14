from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User, Reward, UserReward  # Changed from CustomerUser to User

@admin.register(User)
class UserAdmin(UserAdmin):
    list_display = ('username', 'email', 'role', 'is_staff', 'phone')
    list_filter = ('role', 'is_staff', 'is_superuser')
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'email', 'phone', 'address', 'birth_date', 'avatar')}),
        ('Permissions', {'fields': ('is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
        ('Role', {'fields': ('role',)}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'email', 'password1', 'password2', 'role'),
        }),
    )

@admin.register(Reward)
class RewardAdmin(admin.ModelAdmin):
    list_display = ('name', 'get_type_display', 'threshold', 'description')
    list_filter = ('type',)
    search_fields = ('name', 'description')

    def get_type_display(self, obj):
        return obj.get_type_display()
    get_type_display.short_description = 'Тип достижения'

@admin.register(UserReward)
class UserRewardAdmin(admin.ModelAdmin):
    list_display = ('user', 'reward', 'date_earned')
    list_filter = ('reward', 'date_earned')
    search_fields = ('user__username', 'reward__name')
    raw_id_fields = ('user', 'reward')
    date_hierarchy = 'date_earned'