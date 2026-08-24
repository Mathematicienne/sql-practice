-- ============================================
-- Задача: Доля каждой категории от общей выручки (в процентах)
-- Источник: Superstore Sales (практика)
-- Тема: Вычисление доли от общего итога (OVER без PARTITION)
-- ============================================

SELECT
    Category,
    SUM(Sales) AS total_sales,
    ROUND(
        SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER(), 
        2
    ) AS category_share_percent
FROM sales
GROUP BY Category