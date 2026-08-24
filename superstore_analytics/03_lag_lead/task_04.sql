-- ============================================
-- Задача: Для каждого заказа покажи выручку предыдущего заказа того же клиента
-- Источник: Superstore Sales (практика)
-- Тема: Доступ к предыдущей строке (LAG)
-- ============================================

WITH order_totals AS(
    SELECT
        Order_ID,
        Order_Date,
        Customer_ID,
        Customer_Name,
        SUM(Sales) AS total_sales
    FROM Sales
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
    total_sales,
    LAG(total_sales) OVER(
        PARTITION BY Customer_ID
        ORDER BY Order_Date
    ) AS prev_sales_order
FROM order_totals