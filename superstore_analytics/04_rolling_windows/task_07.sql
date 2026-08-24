-- ============================================
-- Задача: Нарастающий итог выручки по месяцам
-- Источник: Superstore Sales (практика)
-- Тема: Кумулятивные суммы (Running Total)
-- ============================================

WITH year_month_sales AS (
    SELECT
        strftime('%Y-%m', Order_Date) AS YearMonth,
        SUM(Sales) AS total_sales
    FROM sales
    GROUP BY YearMonth
    ORDER BY YearMonth
)

SELECT 
    YearMonth,
    total_sales,
    SUM(total_sales) OVER(
        ORDER BY YearMonth
    ) AS prev_sales
FROM year_month_sales