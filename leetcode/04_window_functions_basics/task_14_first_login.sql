-- ============================================
-- Задача: Найти дату первого входа для каждого игрока.
-- Источник: leetcode.com/problemset/database/, задача №511
-- Тема: Первая запись в группе (ROW_NUMBER)
-- ============================================

WITH number_login AS (
    SELECT
        player_id,
        event_date,
        ROW_NUMBER() OVER(
            PARTITION BY player_id
            ORDER BY event_date
        ) AS rn
    FROM Activity
)

SELECT
    player_id,
    event_date AS first_login
FROM number_login
WHERE rn = 1