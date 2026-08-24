# SQL Practice 🗄️

Коллекция SQL-запросов к открытым учебным базам данных и аналитика Superstore.  
Задачи с [sql-ex.ru](https://sql-ex.ru), [sql-academy.org](https://sql-academy.org) и практика на реальных данных.

---

## 📂 Структура

| Папка | Описание | Кол-во задач |
|-------|----------|-------------|
| `sql-exercises/` | Упражнения по темам: JOIN, агрегация, подзапросы, оконные функции | 11 |
| `superstore_analytics/` | 16 аналитических запросов к учебной БД Superstore | 16 |

**Всего: 27 SQL-задач**

---

## 🛠 Стек

- **Диалекты:** SQLite, MySQL, MS SQL Server
- **Темы:** JOIN, GROUP BY, HAVING, подзапросы, CTE, оконные функции (`OVER`, `PARTITION BY`, `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LEAD`, `LAG`, `NTILE`), скользящие окна

---

## 🚀 Как использовать

### sql-exercises
Запросы можно выполнять на платформах:
- [sql-ex.ru](https://sql-ex.ru/learn_exercises.php)
- [sql-academy.org](https://sql-academy.org/ru/guide)

### superstore_analytics
```bash
cd superstore_analytics
pip install pandas chardet
python load_data.py        # Создаёт superstore.db из CSV
sqlite3 superstore.db      # Интерактивный SQL