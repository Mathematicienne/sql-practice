-- ============================================
-- Задача: Выведите третью транзакцию каждого пользователя. Выведите идентификатор пользователя, сумму и дату транзакции
-- Источник: datalemur.com/questions/, задача User's Third Transaction
-- Тема: Определение N-й записи в группе (ROW_NUMBER)
-- ============================================

WITH transactions_rn AS (
  SELECT
    user_id,
    spend,
    transaction_date,
    ROW_NUMBER() OVER(
      PARTITION BY user_id
      ORDER BY transaction_date
    ) AS rn
  FROM transactions
)

SELECT
  user_id,
  spend,
  transaction_date
FROM transactions_rn
WHERE rn = 3