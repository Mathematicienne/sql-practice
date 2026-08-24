-- ============================================
-- Задача: Дубликаты заказов. Один товар несколько раз в одном заказе
-- Источник: Superstore Sales (практика)
-- Тема: Группировка и фильтрация групп
-- ============================================

SELECT
    Order_ID,
    Product_ID,
    COUNT(*) AS times_in_order
FROM sales
GROUP BY 
    Order_ID, 
    Product_ID
HAVING COUNT(*) > 1