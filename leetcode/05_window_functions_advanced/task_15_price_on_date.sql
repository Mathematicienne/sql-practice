-- ============================================
-- Задача: Изначально все товары стоили 10 рублей. Найдите цены всех товаров на дату 2019-08-16.
-- Источник: leetcode.com/problemset/database/, задача №1164
-- Тема: Последняя цена до даты (ROW_NUMBER + COALESCE)
-- ============================================

WITH desk_rank_products AS (
    SELECT
        product_id,
        new_price,
        change_date,
        DENSE_RANK() OVER(
            PARTITION BY product_id
            ORDER BY change_date DESC
        ) AS rnk
    FROM Products
    WHERE change_date < '2019-08-17'
)

SELECT DISTINCT
    p.product_id,
    IFNULL(d.new_price, 10) AS price
FROM Products p
LEFT JOIN desk_rank_products d
    ON p.product_id = d.product_id
WHERE rnk = 1 OR rnk IS NULL

