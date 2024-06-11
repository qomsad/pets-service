CREATE TABLE contract (
    "id"              BIGSERIAL    NOT NULL,
    "num"             VARCHAR(255) NOT NULL,
    "conclusion_date" DATE         NOT NULL,
    "completion_date" DATE         NOT NULL,
    "customer_id"     BIGINT       NOT NULL,
    "contractor_id"   BIGINT       NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE contract IS 'Муниципальный контракт';
COMMENT ON COLUMN contract.id              IS 'Идентификатор контракта';
COMMENT ON COLUMN contract.num             IS 'Номер контракта';
COMMENT ON COLUMN contract.conclusion_date IS 'Дата заключения';
COMMENT ON COLUMN contract.completion_date IS 'Дата завершения исполнения';
COMMENT ON COLUMN contract.customer_id     IS 'Заказчик';
COMMENT ON COLUMN contract.contractor_id   IS 'Исполнитель';

ALTER TABLE contract ADD CONSTRAINT fk__contract___contractor FOREIGN KEY (contractor_id) REFERENCES organization;
ALTER TABLE contract ADD CONSTRAINT fk__contract___customer FOREIGN KEY (customer_id) REFERENCES organization;
ALTER TABLE contract ADD CONSTRAINT unique_contract UNIQUE (num, conclusion_date, contractor_id, customer_id);