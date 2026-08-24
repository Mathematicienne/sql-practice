-- ============================================
-- Задача: Из таблицы Payments выведите поля family_member, date, payment_id, стоимость покупки в поле payment_amount 
-- и колонку cumulative_total с суммой всех покупок этого члена семьи от самой ранней до текущей записи включительно.
-- Источник: sql-academy.org/ru/guide/sorting-in-windows-functions, задача №2
-- Тема: Сортировка внутри оконных функциях
-- ============================================

SELECT family_member, 
       date, 
       payment_id,
       amount * unit_price AS payment_amount,
       SUM(amount * unit_price) OVER(
           PARTITION BY family_member
           ORDER BY date
       ) AS cumulative_total
FROM Payments