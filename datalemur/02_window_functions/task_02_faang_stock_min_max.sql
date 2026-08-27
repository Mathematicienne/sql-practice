-- ============================================
-- Задача: Для каждой акции FAANG выведите тикер, месяц и год ('Mon-YYYY') с соответствующими максимальной и минимальной ценами открытия. Отсортировать по тикерам.
-- Источник: datalemur.com/questions/, задача FAANG Stock Min-Max (Part 1)
-- Тема: Максимум и минимум в группе (ROW_NUMBER + PARTITION BY)
-- ============================================

WITH rn_max_stock_prices AS (
  SELECT
    ticker,
    date,
    open,
    ROW_NUMBER() OVER(
      PARTITION BY ticker
      ORDER BY open DESC
    ) AS rn_highest
    FROM stock_prices
),

rn_min_stock_prices AS (
    SELECT
    ticker,
    date,
    open,
    ROW_NUMBER() OVER(
      PARTITION BY ticker
      ORDER BY open
    ) AS rn_lowes
  FROM stock_prices
)

SELECT
  rn_max.ticker AS ticker,
  TO_CHAR(rn_max.date, 'Mon-YYYY') AS highest_mth,
  rn_max.open AS highest_open,
  TO_CHAR(rn_min.date, 'Mon-YYYY') AS lowest_mth,
  rn_min.open AS lowest_open
FROM rn_max_stock_prices rn_max
INNER JOIN rn_min_stock_prices rn_min
  ON rn_max.ticker = rn_min.ticker
WHERE rn_max.rn_highest = 1
  AND rn_min.rn_lowes = 1
ORDER BY ticker