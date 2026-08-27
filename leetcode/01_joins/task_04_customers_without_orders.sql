-- ============================================
-- Задача: Найти всех клиентов, которые ничего не заказывали
-- Источник: leetcode.com/problemset/database/, задача №183
-- Тема: Поиск отсутствующих записей (LEFT JOIN + IS NULL)
-- ============================================

SELECT c.name AS Customers
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.id = o.customerId
WHERE o.customerId IS NULL