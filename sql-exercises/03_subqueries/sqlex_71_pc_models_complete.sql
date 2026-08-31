-- ============================================
-- Задача: Найти тех производителей ПК, все модели ПК которых имеются в таблице PC.
-- Источник: sql-ex.ru/learn_exercises.php, задача №71
-- Тема: Двойное NOT EXISTS, коррелированные подзапросы, проверка полноты данных
-- ============================================

SELECT DISTINCT p1.maker
FROM Product p1
WHERE p1.type = 'PC'
    AND NOT EXISTS (
        SELECT 1
        FROM Product p2
        WHERE p2.maker = p1.maker
            AND p2.type = 'PC'
            AND NOT EXISTS (
                SELECT 1
                FROM PC
                WHERE PC.model = p2.model
            )
    )
