-- ============================================
-- Задача: Присвой ранг категориям по общей выручке (1 = самая большая)
-- Источник: Superstore Sales (практика)
-- Тема: Ранжирование агрегированных данных (RANK + GROUP BY)
-- ============================================

SELECT
    Category,
    SUM(Sales) AS sum_sales,
    RANK() OVER(
        ORDER BY SUM(Sales) DESC
    ) AS rank
FROM Sales
GROUP BY Category