import os
import sys
from pathlib import Path

# Критически важные пути
BASE_DIR = Path(__file__).resolve().parent.parent.parent
sys.path.extend([
    str(BASE_DIR),
    str(BASE_DIR / 'ecommerce_project'),
    str(BASE_DIR / 'ecommerce_project' / 'ecommerce_project')
])

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ecommerce_project.settings')

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()

# Диагностика
print("="*50)
print("Python paths:", sys.path)
print("Current dir:", os.getcwd())
print("BASE_DIR:", BASE_DIR)
print("="*50)
