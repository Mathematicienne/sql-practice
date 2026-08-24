-- ============================================
-- Задача: Раздели клиентов на 4 квартиля по сумме заказов (Q1–Q4)
-- Источник: Superstore Sales (практика)
-- Тема: Квартильный анализ (NTILE)
-- ============================================

WITH customer_tiers AS (
    SELECT
        Customer_ID,
        SUM(Sales) AS total_sales,
        NTILE(4) OVER(
            ORDER BY SUM(Sales)
        ) AS quartile
    FROM sales
    GROUP BY Customer_ID
)

SELECT
    Customer_ID,
    total_sales,
    CASE quartile
        WHEN 1 THEN 'VIP (Top 25%)'
        WHEN 2 THEN 'Loyal (Above Avg)'
        WHEN 3 THEN 'Regular (Below Avg)'
        WHEN 4 THEN 'Low Value (Bottom 25%)'
    END AS customer_segment
FROM customer_tiers
