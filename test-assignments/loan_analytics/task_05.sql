-- ============================================
-- Задача: Напишите запрос, формирующий ниже представленный отчет (период 01.07.2021-15.07.2021).
-- =====================================================================
--  Дата займа | Сумма займа | Кол-во займов | Сумма займов | Просрочка
-- ------------+-------------+---------------+--------------+-----------
--  2021.07.01 | 1000        | 100           | 100 000      | 30
--  2021.07.01 | 2000        | 85            | 170 000      | 15
--  2021.07.02 | 1000        | 70            | 70 000       | 25
--  2021.07.02 | 2000        | 87            | 174 000      | 12
--  ...        | ...         | ...           | ...          | ...
-- =====================================================================
--
-- Источник: Тестовое задание по займам
-- Тема: Группировка, агрегация, CASE для подсчёта просрочки
-- ============================================

WITH loan_balance AS (
    SELECT
        a.application_id,
        strftime ('%Y.%m.%d', a.credit_date) AS credit_date,
        a.credit_sum,
        IFNULL(SUM(p.payment), 0) AS total_payments,
        CASE 
            WHEN a.credit_sum > IFNULL(SUM(p.payment), 0)
                AND back_date <  CURRENT_DATE
            THEN 1
            ELSE 0
        END AS flag_delay
    FROM applications a
    LEFT JOIN payments p
        ON a.application_id = p.application_id
    WHERE a.credit_date BETWEEN '2021-07-01' AND '2021-07-15 23:59:59'
        AND a.credit_sum IN (1000, 2000)
    GROUP BY 
        a.application_id,
        strftime ('%Y.%m.%d', a.credit_date),
        a.credit_sum
)

SELECT
    credit_date AS 'Дата займа',
    credit_sum AS 'Сумма займа',
    COUNT(*) AS 'Кол-во займов, шт',
    SUM(credit_sum) AS 'Сумма займов, руб',
    SUM(flag_delay) AS 'Кол-во займов в просрочке, шт'
FROM loan_balance
GROUP BY
    credit_date,
    credit_sum
ORDER BY credit_date
