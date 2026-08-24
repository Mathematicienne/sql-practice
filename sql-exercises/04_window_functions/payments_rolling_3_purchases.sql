-- ============================================
-- Задача: Из таблицы Payments выведите поля family_member, date, payment_id, стоимость покупки в поле payment_amount и 
-- колонку spending_last_3_payments, в которой должна быть сумма стоимости текущей покупки и двух покупок этого же члена семьи, 
-- которые были совершены перед ней. Если предыдущих покупок меньше двух, учитывайте только те, которые есть.
-- Источник: sql-academy.org/ru/guide/windows-functions-frames, задача №1
-- Тема: Рамки окон в оконных функциях

-- Возможные определения границ окна
-- UNBOUNDED PRECEDING, все строки, предшествующие текущей
-- N PRECEDING, N строк до текущей строки
-- CURRENT ROW, текущая строка
-- N FOLLOWING, N строк после текущей строки
-- UNBOUNDED FOLLOWING, все последующие строки
-- ============================================

SELECT
    family_member,
    date,
    payment_id,
    amount * unit_price AS payment_amount,
    SUM(amount * unit_price) OVER(
        PARTITION BY family_member
        ORDER BY date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS spending_last_3_payments
FROM Payments