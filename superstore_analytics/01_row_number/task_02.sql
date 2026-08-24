-- ============================================
-- Задача: Найди топ-3 самых дорогих заказа в каждой категории
-- Источник: Superstore Sales (практика)
-- Тема: Ранжирование и фильтрация топ-N (ROW_NUMBER + WHERE)
-- ============================================

WITH order_total AS (
    SELECT 
        Category,
        Order_ID,
        SUM(Sales) AS total_sales
    FROM sales
    GROUP BY Order_ID, Category
),
ranked AS (
    SELECT
        Category,
        Order_ID,
        total_sales,
        ROW_NUMBER() OVER(
            PARTITION BY Category
            ORDER BY total_sales DESC
        ) AS rn
    FROM order_total
)

SELECT 
    Category,
    Order_ID,
    total_sales
FROM ranked
WHERE rn <= 3