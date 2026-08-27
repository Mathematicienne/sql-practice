-- ============================================
-- Задача: Рассчитать темп роста общих расходов по каждому товару за год, сгруппировав результаты по идентификатору товара.
-- Выведите год в порядке возрастания, идентификатор товара, расходы за текущий год, расходы за предыдущий год и процент роста за год, округленный до двух знаков после запятой.
-- Источник: datalemur.com/questions/, задача Y-on-Y Growth Rate
-- Тема: Темп роста (LAG, агрегация по годам)
-- ============================================

WITH prev_transactions AS (
  SELECT
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    spend,
    LAG(spend) OVER(
      PARTITION BY product_id
      ORDER BY transaction_date
    ) AS prev_year_spend
  FROM user_transactions
)

SELECT
  year,
  product_id,
  spend AS curr_year_spend,
  prev_year_spend,
  ROUND(
    (spend - prev_year_spend) / prev_year_spend * 100, 
    2
  ) AS yoy_rate
FROM prev_transactions

