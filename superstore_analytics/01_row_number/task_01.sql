-- ============================================
-- Задача: Присвой каждому заказу внутри категории порядковый номер по дате (самый ранний = 1)
-- Источник: Superstore Sales (практика)
-- Тема: Нумерация строк в группах (ROW_NUMBER)
-- ============================================

SELECT 
    Category,
    Sub_Category,
    Order_ID,
    Order_Date,
    ROW_NUMBER() OVER(
        PARTITION BY Category
        ORDER BY Order_Date
    ) AS row_number
FROM sales
GROUP BY 
    Order_ID, 
    Category,
    Sub_Category,
    Order_Date