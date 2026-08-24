-- ============================================
-- Задача: Средний чек по категориям
-- Источник: Superstore Sales (практика)
-- Тема: Группировка и агрегация
-- ============================================

WITH order_totals AS (
    SELECT
        Order_ID,
        Category,
        SUM(Sales) AS total_sales
    FROM sales
    GROUP BY
        Order_ID,
        Category
)

SELECT
    Category,
    ROUND(
        AVG(total_sales), 
        2
    ) AS avg_sales
FROM order_totals
GROUP BY Category