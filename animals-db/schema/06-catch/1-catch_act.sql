CREATE TABLE catch_act (
    "id"                BIGSERIAL    NOT NULL,
    "num"               VARCHAR(255) NOT NULL,
    "catch_date"        DATE         NOT NULL,
    "catch_reason"      TEXT                 ,
    "municipality_id"   BIGINT       NOT NULL,
    "organization_id"   BIGINT       NOT NULL,
    "contract_id"       BIGINT       NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE catch_act IS 'Акт отлова';
COMMENT ON COLUMN catch_act.id                IS 'Идентификатор акта отлова';
COMMENT ON COLUMN catch_act.num               IS 'Номер акта отлова';
COMMENT ON COLUMN catch_act.catch_date        IS 'Дата акта отлова';
COMMENT ON COLUMN catch_act.catch_reason      IS 'Причина отлова';
COMMENT ON COLUMN catch_act.municipality_id   IS 'Населённый пункт';
COMMENT ON COLUMN catch_act.organization_id   IS 'Организация по отлову';
COMMENT ON COLUMN catch_act.contract_id       IS 'Муниципальный контракт';

ALTER TABLE catch_act ADD CONSTRAINT fk__catch_act___contract FOREIGN KEY (contract_id) REFERENCES contract;
ALTER TABLE catch_act ADD CONSTRAINT fk__catch_act___municipality FOREIGN KEY (municipality_id) REFERENCES dic_municipality;
ALTER TABLE catch_act ADD CONSTRAINT fk__catch_act___organization FOREIGN KEY (organization_id) REFERENCES organization;