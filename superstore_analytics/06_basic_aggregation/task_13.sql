-- ============================================
-- Задача: Топ-10 товаров по выручке
-- Источник: Superstore Sales (практика)
-- Тема: Агрегация и сортировка
-- ============================================

SELECT
    Product_ID,
    Product_Name,
    SUM(Sales) AS total_sales
FROM sales
GROUP BY 
    Product_ID,
    Product_Name
ORDER BY SUM(Sales) DESC
LIMIT 10