-- ============================================
-- Задача: Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
-- Источник: sql-ex.ru/learn_exercises.php, задача №10
-- Тема: Подзапросы
-- ============================================

SELECT 
    model, 
    price
FROM Printer
WHERE price = (
    SELECT 
        MAX(price)
    FROM Printer
)
