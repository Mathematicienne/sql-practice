-- ============================================
-- Задача: Вывести имя, фамилию, город и штат каждого человека в Person таблице. Если адрес personId отсутствует в Address таблице, выведите null вместо него.
-- Источник: leetcode.com/problemset/database/, задача №175
-- Тема: LEFT JOIN
-- ============================================

SELECT
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId