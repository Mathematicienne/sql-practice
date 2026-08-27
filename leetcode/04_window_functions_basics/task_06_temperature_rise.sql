-- ============================================
-- Задача: Найти все даты, id в которые температура была выше, чем в предыдущие дни (вчера).
-- MySQL-синтаксис
-- Источник: leetcode.com/problemset/database/, задача №197
-- Тема: Доступ к предыдущей строке (LAG)
-- ============================================

WITH temperature_with_prev AS (
    SELECT id,
    recordDate,
    LAG(recordDate) OVER(
        ORDER BY recordDate
    ) AS prev_date,
    temperature,
    LAG(temperature) OVER(
        ORDER BY recordDate
    ) AS prev_temp
    FROM Weather
)

SELECT id
FROM temperature_with_prev
WHERE temperature > prev_temp
    AND prev_date = DATE_SUB(recordDate, INTERVAL 1 DAY)