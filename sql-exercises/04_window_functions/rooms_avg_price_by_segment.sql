-- ============================================
-- Задача: Из таблицы Rooms выведите поля id, home_type, has_tv, price и колонку avg_price_by_segment со средней ценой объявлений 
-- с тем же типом жилья и тем же значением has_tv. Округлите результат до двух знаков после запятой.
-- Источник: sql-academy.org/ru/guide/partitions, задача №2
-- Тема: Партиции в оконных функциях
-- ============================================

SELECT 
    id, 
    home_type, 
    has_tv, 
    price,
    ROUND(
        AVG(price) OVER (
            PARTITION BY home_type, has_tv
        ), 
        2
    ) AS avg_price_by_segment
FROM Rooms