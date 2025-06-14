import os
import sys
from pathlib import Path


def main():
    # Добавляем путь к корню проекта
    sys.path.append(str(Path(__file__).resolve().parent))

    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ecommerce_project.ecommerce_project.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(...) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    main()