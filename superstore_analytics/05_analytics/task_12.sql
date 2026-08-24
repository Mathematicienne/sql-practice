-- ============================================
-- Задача: Retention: клиенты, кто купил в январе и вернулся в феврале (через LAG)
-- Источник: Superstore Sales (практика)
-- Тема: Когортный анализ через LAG
-- ============================================

WITH monthly_orders AS (
    SELECT DISTINCT
        Customer_ID,
        strftime('%Y', Order_Date) AS year,
        strftime('%m', Order_Date) AS month
    FROM sales
),
with_prev AS (
    SELECT
        Customer_ID,
        year,
        month,
        LAG(month) OVER(
            PARTITION BY Customer_ID, year
            ORDER BY month
        ) AS prev_month
    FROM monthly_orders
)

SELECT DISTINCT
    Customer_ID,
    year,
    month,
    prev_month
FROM with_prev
WHERE 
    month = '02' AND prev_month = '01'