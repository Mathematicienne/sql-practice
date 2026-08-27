-- ============================================
-- Задача: Найти вторую по величине уникальную зарплату в таблице Employee. Если второй по величине зарплаты нет, верните null.
-- Источник: leetcode.com/problemset/database/, задача №176
-- Тема: Ранжирование без пропусков (DENSE_RANK)
-- ============================================

WITH NumberHighestSalary AS (
    SELECT 
        salary,
        DENSE_RANK() OVER(
            ORDER BY salary DESC
        ) AS rn
    FROM Employee
)

SELECT MAX(salary) AS SecondHighestSalary
FROM NumberHighestSalary
WHERE rn = 2