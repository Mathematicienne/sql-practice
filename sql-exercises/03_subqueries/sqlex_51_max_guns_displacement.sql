-- ============================================
-- Задача: Найдите названия кораблей, имеющих наибольшее число орудий среди всех имеющихся кораблей такого же водоизмещения (учесть корабли из таблицы Outcomes).
-- Источник: sql-ex.ru/learn_exercises.php, задача №51
-- Тема: CTE с UNION, NOT EXISTS для поиска максимума в группе
-- ============================================

WITH info_ships AS (
    SELECT 
        s.name,
        s.class,
        c.numGuns,
        c.displacement
    FROM Ships s
    LEFT JOIN Classes c
        ON s.class = c.class
    WHERE c.numGuns IS NOT NULL
    
    UNION

    SELECT 
        o.ship AS name,
        o.ship AS class,
        c.numGuns,
        c.displacement
    FROM Outcomes o
    LEFT JOIN Classes c
        ON o.ship = c.class
    WHERE c.numGuns IS NOT NULL
)

SELECT *
FROM info_ships i1
WHERE NOT EXISTS (SELECT 1
    FROM info_ships i2
    WHERE i1.displacement = i2.displacement
    AND i1.numGuns < i2.numGuns)