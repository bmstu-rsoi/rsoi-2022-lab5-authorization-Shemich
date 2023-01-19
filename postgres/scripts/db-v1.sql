
CREATE TABLE IF NOT EXISTS public.ticket
(
    id            SERIAL PRIMARY KEY,
    ticket_uid    uuid UNIQUE NOT NULL,
    username      VARCHAR(80) NOT NULL,
    flight_number VARCHAR(20) NOT NULL,
    price         INT         NOT NULL,
    status        VARCHAR(20) NOT NULL
        CHECK (status IN ('PAID', 'CANCELED'))
);

CREATE TABLE IF NOT EXISTS public.airport
(
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(255),
    city    VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS public.flight
(
    id              SERIAL PRIMARY KEY,
    flight_number   VARCHAR(20)              NOT NULL,
    datetime        TIMESTAMP WITH TIME ZONE NOT NULL,
    from_airport_id INT REFERENCES airport (id),
    to_airport_id   INT REFERENCES airport (id),
    price           INT                      NOT NULL
);

INSERT INTO AIRPORT (ID, NAME, CITY, COUNTRY) VALUES (1, 'Пулково', 'Санкт-Петербург', 'Россия');
INSERT INTO AIRPORT (ID, NAME, CITY, COUNTRY) VALUES (2, 'Шереметьево', 'Москва', 'Россия');
INSERT INTO FLIGHT (ID, FLIGHT_NUMBER, DATETIME, FROM_AIRPORT_ID, TO_AIRPORT_ID, PRICE) VALUES (1, 'AFL031', '2021-10-08 20:00', 1, 2, 1500);
INSERT INTO PRIVILEGE (ID, USERNAME, STATUS, BALANCE) VALUES (1, 'Test Max', 'BRONZE', 0);

CREATE TABLE IF NOT EXISTS public.privilege
(
    id       SERIAL PRIMARY KEY,
    username VARCHAR(80) NOT NULL UNIQUE,
    status   VARCHAR(80) NOT NULL DEFAULT 'BRONZE'
        CHECK (status IN ('BRONZE', 'SILVER', 'GOLD')),
    balance  INT
);

CREATE TABLE IF NOT EXISTS public.privilege_history
(
    id             SERIAL PRIMARY KEY,
    privilege_id   INT REFERENCES privilege (id),
    ticket_uid     uuid        NOT NULL,
    datetime       TIMESTAMP   NOT NULL,
    balance_diff   INT         NOT NULL,
    operation_type VARCHAR(20) NOT NULL
        CHECK (operation_type IN ('FILL_IN_BALANCE', 'DEBIT_THE_ACCOUNT'))
);
