-- ============================================
-- Схема: Аналитика займов (Тестовое задание)
-- Таблицы: customers, regions, applications, payments
-- ============================================

-- Словарь регионов
CREATE TABLE regions (
    region_id   INT PRIMARY KEY,
    timezone    VARCHAR(255)
);

-- Клиенты
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    region_id   INT,
    created     DATETIME,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Займы
CREATE TABLE applications (
    application_id  INT PRIMARY KEY,
    credit_date     DATETIME,
    customer_id     INT,
    back_date       DATETIME,
    credit_sum      DECIMAL(8, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Платежи
CREATE TABLE payments (
    application_id  INT NOT NULL,
    created_at      DATETIME,
    payment         DECIMAL(8, 2),
    FOREIGN KEY (application_id) REFERENCES applications(application_id)
);

-- ============================================
-- Тестовые данные (минимальный набор для проверки)
-- ============================================

INSERT INTO regions (region_id, timezone) VALUES
(1, '3+'),
(2, '4+'),
(3, '5+'),
(4, '8+');

INSERT INTO customers (customer_id, region_id, created) VALUES
(101, 1, '2022-06-15 17:49:49'),
(102, 2, '2021-04-10 17:34:28'),
(103, 3, '2021-05-20 00:14:08'),
(104, 4, '2023-02-01 18:48:12'),
(105, 2, '2021-06-30 21:19:48');

INSERT INTO applications (application_id, credit_date, customer_id, back_date, credit_sum) VALUES
(1001, '2021-07-05 11:56:54', 102, '2021-08-05 02:07:09', 6000.00),
(1002, '2021-07-12 05:59:17', 103, '2021-08-12 00:27:02', 10000.00),
(1003, '2023-06-15 23:46:52', 104, '2023-07-15 17:44:49', 3000.00),
(1004, '2021-07-05 20:25:56', 102, '2021-08-05 18:48:12', 4000.00);

INSERT INTO payments (application_id, created_at, payment) VALUES
(1001, '2021-07-10 21:25:56', 2000.00),
(1001, '2021-08-01 17:49:49', 4000.00),
(1002, '2021-09-01 00:14:08', 3000.00);

-- ============================================
-- Таблица view_loans (для задач 6.1–6.3)
-- ============================================

CREATE TABLE IF NOT EXISTS view_loans (
    client_id    INT NOT NULL,
    loan_id      INT PRIMARY KEY,
    created_at   DATETIME,
    loan_amount  DECIMAL(8, 2),
    client_type  VARCHAR(50)
);

INSERT INTO view_loans (client_id, loan_id, created_at, loan_amount, client_type) VALUES
(34565,  998881, '2023-12-12 17:49:49', 2000, 'Repeated'),
(87654,  998884, '2023-08-27 17:34:28', 2000, 'Repeated'),
(87654,  998888, '2023-08-27 00:14:08', 5000, 'New'),
(112233, 998877, '2021-07-29 18:48:12', 5000, 'New'),
(34565,  998880, '2023-06-09 21:19:48', 6000, 'New'),
(34565,  998883, '2024-08-01 11:56:54', 6000, 'Repeated'),
(87654,  998887, '2023-12-27 02:07:09', 6000, 'Repeated'),
(34565,  998882, '2024-02-26 05:59:17', 7000, 'Repeated'),
(87654,  998886, '2023-11-20 00:27:02', 7000, 'Repeated'),
(112233, 998879, '2023-10-18 23:46:52', 7000, 'Repeated'),
(87654,  998885, '2023-08-29 17:44:49', 9000, 'Repeated'),
(112233, 998878, '2023-11-15 20:25:56', 9000, 'Repeated'),
(654234, 995456, '2021-07-29 18:48:12', 4000, 'New'),
(654234, 995457, '2023-11-17 21:25:56', 7000, 'Repeated');