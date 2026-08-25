# Тестовое задание: Аналитика займов
**Схема:** customers, regions, applications, payments

---

## Задачи

| № | Задача | Тема |
|---|--------|------|
| 1 | Регионы клиентов после 01.01.2023 | JOIN, фильтрация по дате |
| 2 | Клиенты 2Q 2021 с часовым поясом 4+–8+ | JOIN, диапазон значений |
| 3 | Займы июля 2021 > 5000, разбивка по дням | GROUP BY, агрегация |
| 4 | Займы и платежи за периоды | JOIN с условием по дате |
| 5 | Отчёт по просрочкам | CTE, CASE, оконные функции |
| 6.1 | Нумерация повторных займов | ROW_NUMBER |
| 6.2 | Клиенты с >1 повторным займом | GROUP BY, HAVING |
| 6.3 | Займы выше среднего | Подзапрос, AVG |

---

## Схема данных

```sql
-- customers
customer_id INT PK
region_id INT FK
created DATETIME

-- regions  
region_id INT PK
timezone VARCHAR(255)

-- applications
application_id INT PK
credit_date DATETIME
customer_id INT FK
back_date DATETIME
credit_sum DECIMAL(8,2)

-- payments
application_id INT FK
created_at DATETIME
payment DECIMAL(8,2)

-- view_loans
client_id    INT
loan_id      INT PK
created_at   DATETIME
loan_amount  DECIMAL(8, 2)
client_type  VARCHAR(50)