# SQL Exercises

Задачи с платформ [sql-ex.ru](https://sql-ex.ru) и [sql-academy.org](https://sql-academy.org).

## Темы

| Папка | Тема | Файлы |
|-------|------|-------|
| `01_joins/` | Явные соединения (JOIN) | `laptops_with_hd_10.sql` |
| `02_aggregation/` | Агрегация и фильтрация групп | `makers_with_3_plus_pcs.sql` |
| `03_subqueries/` | Подзапросы, EXISTS, NOT EXISTS, коррелированные запросы | 4 файла |
| `04_window_functions/` | Оконные функции | 8 файлов |

## Схемы баз данных

### sql-ex.ru — Компьютерная фирма
- `Product` — производители и модели (`maker`, `model`, `type`)
- `PC` — характеристики ПК
- `Laptop` — характеристики ноутбуков
- `Printer` — характеристики принтеров

### sql-ex.ru — Корабли
- `Ships` — корабли (`name`, `class`, `launched`)
- `Classes` — классы кораблей (`class`, `type`, `country`, `numGuns`, `bore`, `displacement`)
- `Outcomes` — результаты сражений (`ship`, `battle`, `result`)
- `Battles` — сражения (`name`, `date`)

### sql-academy.org
- `Rooms` — объявления о жилье
- `Trip` — рейсы авиакомпаний
- `Payments` — покупки членов семьи