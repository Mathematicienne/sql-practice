-- ============================================
-- Задача: Если предпочтительная дата доставки совпадает с датой заказа, то заказ называется немедленным, в противном случае — запланированным.
-- Первым заказом клиента считается заказ с самой ранней датой. Гарантируется, что у клиента может быть только один первый заказ.
-- Напишите решение, которое находит процент срочных заказов в первых заказах всех клиентов с округлением до двух знаков после запятой.
-- Источник: leetcode.com/problemset/database/, задача №1174
-- Тема: Процент срочных заказов (ROW_NUMBER + CASE + агрегация)
-- ============================================

WITH Delivery_rank AS (
    SELECT
        customer_id,
        order_date,
        customer_pref_delivery_date,
        ROW_NUMBER() OVER(
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS rn,
        CASE
            WHEN order_date = customer_pref_delivery_date THEN 1
            ELSE 0
        END AS flag_Delivery_immediat
    FROM Delivery
)

SELECT
    ROUND(
        SUM(flag_Delivery_immediat) / COUNT(*) * 100, 
        2
    ) AS immediate_percentage 
FROM Delivery_rank
WHERE rn = 1