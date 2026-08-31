# SQL Practice 🗄️

Коллекция SQL-запросов к открытым учебным базам данных и аналитика Superstore.  
Задачи с [sql-ex.ru](https://sql-ex.ru), [sql-academy.org](https://sql-academy.org), [leetcode.com](https://leetcode.com), [datalemur.com](https://datalemur.com) и практика на реальных данных и реальные кейсы с собеседований.

---

## 📂 Структура

| Папка | Описание | Кол-во задач |
|-------|----------|-------------|
| `sql-exercises/` | Упражнения по темам: JOIN, агрегация, подзапросы, оконные функции | 14 |
| `superstore_analytics/` | 16 аналитических запросов к учебной БД Superstore | 16 |
| `test-assignments/loan_analytics/` | Аналитика займов | 8 |
| `test-assignments/service_requests/` | Отчёт по заявлениям: фильтрация, последнее событие, справочники | 1 |
| `leetcode/` | 18 задач с LeetCode: JOIN, оконные функции, агрегация | 18 |
| `datalemur/` | 5 задач с DataLemur: Self JOIN, оконные функции, аналитика | 5 |

**Всего: 63 SQL-задач**

---

## 🛠 Стек

- **Диалекты:** SQLite, MySQL, MS SQL Server, PostgreSQL
- **Темы:** JOIN, GROUP BY, HAVING, подзапросы, CTE, оконные функции (`OVER`, `PARTITION BY`, `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LEAD`, `LAG`, `NTILE`), скользящие окна, когортный анализ

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
```

### test-assignments
Тестовые задачи с собеседований
Каждая папка содержит `schema.sql` с CREATE TABLE и тестовыми данными - создай базу любым удобным способом.

### leetcode
Запросы можно выполнять на платформе:
- [leetcode.com](https://leetcode.com/problemset/database/)

### datalemur
Запросы можно выполнять на платформе:
- [datalemur.com](https://datalemur.com/questions/)