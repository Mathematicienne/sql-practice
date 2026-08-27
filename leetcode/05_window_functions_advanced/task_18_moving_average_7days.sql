-- ============================================
-- Задача: Вычислите скользящее среднее значение суммы, которую клиенты заплатили за семь дней (то есть за текущий день и 6 дней до него). 
-- average_amount должно быть округлено до двух знаков после запятой.
-- MySQL-синтаксис
-- Источник: leetcode.com/problemset/database/, задача №1321
-- Тема: Скользящее окно по датам (RANGE BETWEEN INTERVAL)
-- ============================================

WITH daily_amount AS (
    SELECT
        visited_on,
        SUM(amount) AS total_amount,
        ROW_NUMBER() OVER(
            ORDER BY visited_on
        ) AS rn
    FROM Customer
    GROUP BY visited_on
),
sum_amount_seven_day AS (
    SELECT
        visited_on,
        SUM(total_amount) OVER(
            ORDER BY visited_on
            RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
        ) AS sum_amount,
        rn
    FROM daily_amount
)

SELECT 
    visited_on,
    sum_amount AS amount,
    ROUND(sum_amount / 7, 
        2
    ) AS average_amount
FROM sum_amount_seven_day
WHERE rn >= 7
ORDER BY visited_on