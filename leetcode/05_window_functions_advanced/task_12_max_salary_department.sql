-- ============================================
-- Задача: Нвйти сотрудников с самой высокой зарплатой в каждом из отделов.
-- Источник: leetcode.com/problemset/database/, задача №184
-- Тема: Ранжирование внутри групп (DENSE_RANK + PARTITION BY)
-- ============================================

WITH department_ranked AS (
    SELECT
        e.name,
        e.salary,
        d.name AS Department,
        DENSE_RANK() OVER(
            PARTITION BY d.name
            ORDER BY salary DESC
        ) AS rnk
    FROM Employee e
    LEFT JOIN Department d
        ON e.departmentId = d.id
)

SELECT 
    Department,
    name AS Employee,
    salary AS Salary
FROM department_ranked
WHERE rnk = 1