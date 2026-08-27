-- ============================================
-- Задача: Найти сотрудников с высоким доходом в каждом из отделов. Высоким доходом считается — зарплата, входящая в тройку самых высоких зарплат в этом отделе.
-- Источник: leetcode.com/problemset/database/, задача №185
-- Тема: Топ-N в группах (DENSE_RANK + PARTITION BY + фильтрация ранга)
-- ============================================

WITH employee_ranked AS (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER(
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS rnk
    FROM Employee
)

SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM employee_ranked e
LEFT JOIN Department d
    ON e.departmentId = d.id
WHERE rnk < 4