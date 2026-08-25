-- ============================================
-- Задача: Выведите кол-во займов и сумму займов за июнь 2023г, а также кол-во платежей и сумму платежей по этим займам за второе полугодие 2023г.
-- Источник: Тестовое задание по займам
-- Тема: Агрегация займов и платежей с фильтрацией по периодам
-- ============================================

WITH h2_payments AS (
    SELECT
        application_id,
        COUNT(payment) AS count_payments,
        SUM(payment) AS total_payments
    FROM payments
    WHERE created_at BETWEEN '2023-07-01' AND '2023-12-31 23:59:59'
    GROUP BY application_id
),

loans_with_payments AS (
    SELECT
        a.application_id,
        a.credit_sum,
        p.count_payments,
        p.total_payments
    FROM applications a
    LEFT JOIN h2_payments p
        ON a.application_id = p.application_id
    WHERE a.credit_date BETWEEN '2023-06-01' AND '2023-06-30 23:59:59'
)


SELECT
    COUNT(application_id) AS count_applications,
    SUM(credit_sum) AS total_sum,
    SUM(count_payments) AS count_payments,
    SUM(total_payments) AS total_payments
FROM loans_with_payments;

