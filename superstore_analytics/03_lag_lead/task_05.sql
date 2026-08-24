-- ============================================
-- Задача: Для каждого месяца покажи прирост выручки к предыдущему месяцу
-- Источник: Superstore Sales (практика)
-- Тема: Анализ динамики с LAG (темп роста)
-- ============================================

WITH year_month_sales AS (
    SELECT
        strftime('%Y-%m', Order_Date) AS YearMonth,
        SUM(Sales) AS total_sales
    FROM sales
    GROUP BY YearMonth
),
with_prev AS (
    SELECT 
        YearMonth,
        total_sales,
        LAG(total_sales) OVER(
            ORDER BY YearMonth
        ) AS prev_month_sales
    FROM year_month_sales
)

SELECT 
    YearMonth,
    total_sales,
    ROUND(
        (total_sales - prev_month_sales) / prev_month_sales * 100,
        2
    ) AS growth_percent
FROM with_prev