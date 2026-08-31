-- ============================================
-- Задача: Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.
-- Источник: sql-ex.ru/learn_exercises.php, задача №50
-- Тема: EXISTS, коррелированный подзапрос, связь между таблицами
-- ============================================

SELECT DISTINCT battle
    FROM Outcomes o
    WHERE EXISTS (
        SELECT 1
        FROM Ships s
        WHERE s.name = o.ship
            AND class = 'Kongo'
        )