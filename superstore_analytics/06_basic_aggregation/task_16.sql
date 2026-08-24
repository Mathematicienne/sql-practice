-- ============================================
-- Задача: Клиенты с аномально высокими заказами (выбросы)
-- Источник: Superstore Sales (практика)
-- Тема: Статистический анализ с оконными функциями
-- ============================================

WITH order_totals AS (
    SELECT
        Order_ID,
        Customer_ID,
        Customer_Name,
        SUM(Sales) AS total_sales
    FROM sales
    GROUP BY
        Order_ID,
        Customer_ID,
        Customer_Name
), 
percentiles AS (
    SELECT
        Order_ID,
        Customer_ID,
        Customer_Name,
        total_sales,
        NTILE(20) OVER(
            ORDER BY total_sales DESC
        ) AS percentile_group
    FROM order_totals
)


SELECT DISTINCT
    Customer_ID,
    Customer_Name
FROM percentiles
WHERE percentile_group = 1