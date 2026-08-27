-- ============================================
-- Задача: Выведите самых высокооплачиваемых сотрудников в каждом отделе. «Высокооплачиваемый сотрудник» в отделе — это сотрудник, 
-- чья зарплата входит в тройку самых высоких в этом отделе. Напишите запрос, который будет отображать имя сотрудника, название его отдела и зарплату. 
-- В случае дублирования результатов отсортируйте их по названию отдела в порядке возрастания, а затем по зарплате в порядке убывания. 
-- Если у нескольких сотрудников одинаковая зарплата, расположите их в алфавитном порядке.
-- Источник: datalemur.com/questions/, задача Top Three Salaries
-- Тема: Топ-N в группах (DENSE_RANK + PARTITION BY + WHERE)
-- ============================================

WITH ranked_employees AS (
  SELECT
    department_id,
    name,
    salary,
    DENSE_RANK() OVER(
      PARTITION BY department_id
      ORDER BY salary DESC
    ) AS rank_position
  FROM employee
)

SELECT
  d.department_name,
  e.name,
  e.salary
FROM ranked_employees e
LEFT JOIN department d
  ON e.department_id = d.department_id
WHERE rank_position <= 3
ORDER BY 
  d.department_name,
  e.salary DESC,
  e.name