from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model
from datetime import date
from users.models import User

User = get_user_model()


class UserRegisterForm(UserCreationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Русские labels для стандартных полей
        self.fields['username'].label = 'Логин'
        self.fields['email'].label = 'Электронная почта'
        self.fields['password1'].label = 'Пароль'
        self.fields['password2'].label = 'Подтверждение пароля'
        self.fields['first_name'].label = 'Имя'
        self.fields['last_name'].label = 'Фамилия'
        self.fields['phone'].label = 'Телефон'

        # Русские help_texts
        self.fields['username'].help_text = 'Только буквы, цифры и @/./+/-/_'
        self.fields['password1'].help_text = 'Пароль должен содержать минимум 8 символов'
        self.fields['password2'].help_text = 'Повторите пароль для подтверждения'

    birth_date = forms.DateField(
        widget=forms.DateInput(attrs={'type': 'date'}),
        label='Дата рождения',
        required=True,
        help_text='Укажите вашу дату рождения'
    )

    class Meta:
        model = get_user_model()
        fields = ('username', 'email', 'password1', 'password2',
                  'first_name', 'last_name', 'phone', 'birth_date', 'avatar')
        labels = {
            'avatar': 'Аватар профиля',
        }
        help_texts = {
            'avatar': 'Загрузите изображение для вашего профиля',
        }

    def clean_birth_date(self):
        birth_date = self.cleaned_data.get('birth_date')
        if birth_date and birth_date > date.today():
            raise forms.ValidationError("Дата рождения не может быть в будущем")
        return birth_date


class ProfileEditForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('first_name', 'last_name', 'email', 'phone', 'address', 'birth_date', 'avatar')
