# utils.py
def get_compare_owner(request):
    if request.user.is_authenticated:
        return {'user': request.user}
    if not request.session.session_key:
        request.session.create()
    return {'session_key': request.session.session_key}


def get_compare_owner(request):
    """Возвращает фильтр для поиска сравнения (для авторизованных и анонимных пользователей)"""
    if request.user.is_authenticated:
        return {'user': request.user}
    else:
        session_key = request.session.session_key
        if not session_key:
            request.session.create()
            session_key = request.session.session_key
        return {'session_key': session_key}