-- ============================================
-- Задача: Для каждого клиента найди его первый заказ 
--      (флаг: 1 если первый, 0 если нет)
-- Источник: Superstore Sales (практика)
-- Тема: Определение первого/последнего события (ROW_NUMBER = 1)
-- ============================================

WITH customer_orders AS(
    SELECT
        Order_ID,
        Order_Date,
        Customer_ID,
        Customer_Name,
        SUM(Sales) AS total_sales
    FROM sales
    GROUP BY
        Order_ID,
        Order_Date,
        Customer_ID,
        Customer_Name
)

SELECT
    Order_ID,
    Order_Date,
    Customer_ID,
    Customer_Name,
    CASE
        WHEN ROW_NUMBER() OVER(
            PARTITION BY Customer_ID
            ORDER BY Order_Date
        ) = 1 THEN 1
        ELSE 0
    END AS rn
FROM customer_orders