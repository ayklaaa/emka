import json

with open("db_backup.json", "r", encoding="utf-8") as f:
    data = json.load(f)

categories = []
rest = []

# Системные модели, которые не нужно импортировать
excluded_models = {
    "contenttypes.contenttype",
    "auth.permission",  # Можно оставить, если нужны права
    "sessions.session",  # Не нужно
    "admin.logentry",    # Не нужно
}

for entry in data:
    model = entry.get("model")
    if model in excluded_models:
        continue  # Пропускаем
    elif model == "products.category":
        categories.append(entry)
    else:
        rest.append(entry)

with open("categories.json", "w", encoding="utf-8") as f:
    json.dump(categories, f, ensure_ascii=False, indent=2)

with open("rest.json", "w", encoding="utf-8") as f:
    json.dump(rest, f, ensure_ascii=False, indent=2)

print(f"✅ Разделение завершено:\n- categories.json: {len(categories)} записей\n- rest.json: {len(rest)} записей")
