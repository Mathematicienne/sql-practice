-- ============================================
-- Задача: Отчёт по заявлениям в статусах 3 и 4, поданным с 01.05.2025 по 15.05.2025 (вкл),
-- по услугам 600775 и 664361. Для каждого заявления подтягивается последнее событие request из splog_xml.
-- Источник: Практическое задание (тестовое)
-- Тема: CTE, ROW_NUMBER для последнего события, JOIN
-- ============================================

WITH filtered_orders AS (
    SELECT 
        status_history_id,
        order_id,
        request_date,
        service_passport_id
    FROM order_hist
    WHERE request_date BETWEEN '2025-05-01' AND '2025-05-15 23:59:59'
        AND service_passport_id IN (600775, 664361)
),

splog_request AS (
    SELECT 
        order_id,
        region,
        department,
        ROW_NUMBER() OVER(
            PARTITION BY order_id
            ORDER BY log_date DESC
        ) AS rn
    FROM splog_xml
    WHERE state = 'request'
)

SELECT
    o_h.order_id AS "Номер заявления",
    o_h.request_date AS "Дата подачи",
    o_h.service_passport_id AS "Код услуги",
    st.status_id AS "Идентификатор статуса",
    o_s.name AS "Текущий статус",
    st.status_date AS "Дата текущего статуса",
    sp.region AS "Регион",
    sp.department AS "Подразделение"
FROM filtered_orders o_h
INNER JOIN status_hist st
    ON o_h.status_history_id = st.id
    AND st.status_id IN (3, 4)
INNER JOIN order_status o_s
    ON st.status_id = o_s.order_status_id
LEFT JOIN splog_request sp
    ON o_h.order_id = sp.order_id
    AND sp.rn = 1