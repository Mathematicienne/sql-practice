import pandas as pd
import sqlite3
import chardet
import os

script_dir = os.path.dirname(os.path.abspath(__file__))
csv_path = os.path.join(script_dir, 'Superstore.csv')
db_path = os.path.join(script_dir, 'superstore.db')

with open(csv_path, 'rb') as f:
    result = chardet.detect(f.read(10000))  # читаем первые 10 КБ
    encoding = result['encoding']
    print(f"Определена кодировка: {encoding}")

df = pd.read_csv(csv_path, encoding=encoding)
conn = sqlite3.connect(db_path)
df.to_sql('sales', conn, if_exists='replace', index=False)
conn.close()
print(f"Готово! База создана: {db_path}")
