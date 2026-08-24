-- ============================================
-- Задача: Для каждого региона найди заказ с максимальной выручкой (не используя GROUP BY)
-- Источник: Superstore Sales (практика)
-- Тема: Поиск максимума в группе без GROUP BY
-- ============================================

WITH order_rank_to_region AS (
    SELECT
        Region,
        Order_ID,
        SUM(Sales) AS total_sales,
        RANK() OVER(
            PARTITION BY Region
            ORDER BY SUM(Sales) DESC
        ) AS rank_region
    FROM Sales
    GROUP BY
        Order_ID,
        Region
)

SELECT
    Region,
    Order_ID,
    total_sales
FROM order_rank_to_region
WHERE rank_region = 1