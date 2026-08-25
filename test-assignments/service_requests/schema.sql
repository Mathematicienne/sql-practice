-- ============================================
-- Схема: Заявления на услуги (тестовое задание)
-- ============================================

-- История заявлений
CREATE TABLE order_hist (
    status_history_id   INT PRIMARY KEY,
    order_id            INT NOT NULL,
    request_date        DATETIME NOT NULL,
    service_passport_id INT NOT NULL
);

-- История статусов
CREATE TABLE status_hist (
    id          INT PRIMARY KEY,
    status_id   INT NOT NULL,
    status_date DATETIME NOT NULL
);

-- Справочник статусов
CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY,
    name            VARCHAR(255) NOT NULL
);

-- Лог событий XML
CREATE TABLE splog_xml (
    order_id    INT NOT NULL,
    state       VARCHAR(50) NOT NULL,
    log_date    DATETIME NOT NULL,
    region      VARCHAR(255),
    department  VARCHAR(255)
);

-- Тестовые данные (минимальный набор)
INSERT INTO order_hist VALUES
(1, 1001, '2025-05-05 10:00:00', 600775),
(2, 1002, '2025-05-10 14:30:00', 664361),
(3, 1003, '2025-05-20 09:00:00', 600775);  -- вне периода

INSERT INTO status_hist VALUES
(1, 3, '2025-05-05 12:00:00'),
(2, 4, '2025-05-10 16:00:00'),
(3, 1, '2025-05-20 10:00:00');

INSERT INTO order_status VALUES
(1, 'Создано'),
(3, 'В обработке'),
(4, 'Завершено');

INSERT INTO splog_xml VALUES
(1001, 'request', '2025-05-05 10:05:00', 'Москва', 'Отдел 1'),
(1001, 'request', '2025-05-05 10:10:00', 'Москва', 'Отдел 2'),
(1002, 'request', '2025-05-10 14:35:00', 'СПб', 'Отдел 3');