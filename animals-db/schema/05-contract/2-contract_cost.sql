CREATE TABLE contract_cost (
    "id"                BIGSERIAL NOT NULL,
    "catch_cost"        FLOAT8    NOT NULL,
    "contract_id"       BIGINT    NOT NULL,
    "municipality_id"   BIGINT    NOT NULL,
    PRIMARY KEY (id)
);
COMMENT ON TABLE contract_cost IS 'Стоимость работ по контракту';
COMMENT ON COLUMN contract_cost.id                IS 'Идентификатор стоимости работы';
COMMENT ON COLUMN contract_cost.catch_cost        IS 'Стоимость отлова';
COMMENT ON COLUMN contract_cost.contract_id       IS 'Идентификатор контракта';
COMMENT ON COLUMN contract_cost.municipality_id   IS 'Идентификатор населённого пункта';

ALTER TABLE contract_cost ADD CONSTRAINT fk__contract_work_cost___contract FOREIGN KEY (contract_id) REFERENCES contract ON DELETE CASCADE;
ALTER TABLE contract_cost ADD CONSTRAINT fk__contract_work_cost___municipality FOREIGN KEY (municipality_id) REFERENCES dic_municipality;
ALTER TABLE contract_cost ADD CONSTRAINT catch_is_positive_or_zero CHECK (catch_cost >= 0);
ALTER TABLE contract_cost ADD CONSTRAINT contract_cost_municipality UNIQUE (municipality_id, contract_id);
