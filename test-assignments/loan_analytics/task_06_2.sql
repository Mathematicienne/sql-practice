-- ============================================
-- Задача: Вывести уникальных клиентов, у которых больше одного повторного займа.
-- Источник: Тестовое задание по займам
-- Тема: Фильтрация групп с условием
-- ============================================

SELECT
    client_id,
    COUNT(client_id) AS count_loan
FROM view_loans
WHERE client_type = 'Repeated'
GROUP BY client_id
HAVING COUNT(client_id) > 1