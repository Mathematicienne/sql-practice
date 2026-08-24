# Создай файл load_data.py в VS Code и запусти:
import pandas as pd
import sqlite3
import chardet

with open('Superstore.csv', 'rb') as f:
    result = chardet.detect(f.read(10000))  # читаем первые 10 КБ
    encoding = result['encoding']
    print(f"Определена кодировка: {encoding}")


df = pd.read_csv('Superstore.csv', encoding=encoding)
conn = sqlite3.connect('superstore.db')
df.to_sql('sales', conn, if_exists='replace', index=False)
conn.close()
print("Готово!")