-- ============================================
-- Задача: Напишите запрос, чтобы узнать количество компаний, разместивших дублирующиеся объявления о вакансиях.
-- Источник: datalemur.com/questions/, задача Duplicate Job Listings
-- Тема: Поиск дубликатов через SELF JOIN
-- ============================================

SELECT COUNT(DISTINCT j1.company_id) AS duplicate_companies
FROM job_listings j1
INNER JOIN job_listings j2
  ON j1.company_id = j2.company_id
  AND j1.title = j2.title
  AND j1.description = j2.description
  AND j1.job_id < j2.job_id