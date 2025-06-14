with open('rescue_data.json', 'rb') as f:
    content = f.read().decode('utf-16')  # или 'cp1251' для ANSI

with open('rescue_data_fixed.json', 'w', encoding='utf-8') as f:
    f.write(content)