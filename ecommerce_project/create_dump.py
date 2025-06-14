import sqlite3

# Укажите путь к вашей базе данных
input_db = "db.sqlite3"
output_file = "backup.sql"

conn = sqlite3.connect(input_db)
with open(output_file, 'w', encoding='utf-8') as f:
    for line in conn.iterdump():
        f.write(f"{line}\n")
conn.close()

print(f"Дамп успешно создан: {output_file}")