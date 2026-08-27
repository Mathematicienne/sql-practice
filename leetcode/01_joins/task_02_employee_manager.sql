-- ============================================
-- Задача: Найдите сотрудников, зарабатывающих больше, чем их руководители.
-- Источник: leetcode.com/problemset/database/, задача №181
-- Тема: Сравнение строк внутри одной таблицы
-- ============================================

SELECT e1.name AS Employee 
FROM Employee e1
INNER JOIN Employee e2
    ON e1.managerId = e2.id
WHERE e1.salary > e2.salary