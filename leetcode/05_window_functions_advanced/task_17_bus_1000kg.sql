-- ============================================
-- Задача: Люди стоят в очереди, чтобы сесть в автобус. Однако максимальный вес автобуса составляет 1000 кг, поэтому некоторые люди могут не поместиться.
-- Найдите person_name последнего человека, который может поместиться в автобусе, не превысив допустимый вес. Вес первого человека не превышает допустимый.
-- Источник: leetcode.com/problemset/database/, задача №1204
-- Тема: Кумулятивная сумма (SUM OVER ORDER BY)
-- ============================================

WITH Queue_weight_bus AS (
    SELECT
        person_name,
        SUM(weight) OVER(
            ORDER BY turn
        ) AS weight_bus
    FROM Queue
)

SELECT person_name
FROM Queue_weight_bus
WHERE weight_bus <= 1000
ORDER BY weight_bus DESC
LIMIT 1