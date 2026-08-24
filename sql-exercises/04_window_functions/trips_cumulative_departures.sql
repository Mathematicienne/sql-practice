-- ============================================
-- Задача: Из таблицы Trip выведите поля company, id, time_out и колонку departures_so_far с количеством рейсов этой компании 
-- от самого раннего вылета до текущей записи включительно. При одинаковом значении time_out более ранней считайте запись с меньшим id.
-- Источник: sql-academy.org/ru/guide/sorting-in-windows-functions, задача №1
-- Тема: Сортировка в оконных функциях
-- ============================================

SELECT 
    company, 
    id, 
    time_out,
    COUNT(*) OVER(
        PARTITION BY company 
        ORDER BY time_out, id
    ) AS departures_so_far
FROM Trip