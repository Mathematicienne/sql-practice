-- ============================================
-- Задача: Найти клиентов с датой выдачи займа в июле 2021г и с суммой займа более 5000. Определить количество и сумму выдач с разбивкой по дням. 
-- Источник: Тестовое задание по займам
-- Тема: Фильтрация, группировка и агрегация
-- ============================================

WITH july_loans AS (
    SELECT
        customer_id,
        credit_date,
        credit_sum
    FROM applications
    WHERE credit_date BETWEEN '2021-07-01' AND '2021-07-31 23:59:59'
        AND credit_sum > 5000
)

SELECT
    DATE(credit_date) AS Date,
    COUNT(*) AS count,
    SUM(credit_sum) AS total_credit
FROM july_loans
GROUP BY DATE(credit_date)