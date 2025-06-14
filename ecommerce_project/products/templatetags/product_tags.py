from django import template

register = template.Library()

@register.filter(name='get_rating_text')
def get_rating_text(rating):
    rating_map = {
        1: "Ужасно",
        2: "Плохо",
        3: "Нормально",
        4: "Хорошо",
        5: "Отлично"
    }
    return rating_map.get(rating, "")