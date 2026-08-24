-- ============================================
-- Задача: Скользящее среднее продаж за 3 месяца (текущий + 2 предыдущих)
-- Источник: Superstore Sales (практика)
-- Тема: Скользящие окна (ROWS BETWEEN)
-- ============================================

WITH year_month_sales AS (
    SELECT 
        strftime('%Y-%m', Order_Date) AS YearMonth,
        SUM(Sales) AS total_sales
    FROM sales
    GROUP BY YearMonth
)

SELECT 
    YearMonth,
    total_sales,
    AVG(total_sales) OVER(
        ORDER BY YearMonth
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS avg_sales_3_month
FROM year_month_sales