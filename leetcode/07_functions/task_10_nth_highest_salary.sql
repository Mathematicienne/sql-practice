-- ============================================
-- Задача: Найти вторую по величине уникальную зарплату в таблице Employee. Если второй по величине зарплаты нет, верните null.
-- Источник: leetcode.com/problemset/database/, задача №177
-- Тема: Пользовательские функции (CREATE FUNCTION) + DENSE_RANK
-- ============================================

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    RETURN (
        WITH NumberHighestSalary AS (
            SELECT 
                salary,
                DENSE_RANK() OVER(
                    ORDER BY salary DESC
                ) AS rank_position
            FROM Employee
        )

        SELECT MAX(salary)
        FROM NumberHighestSalary
        WHERE rank_position = N
    );
END