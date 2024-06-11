CREATE TABLE catch_schedule (
    "id"                       BIGSERIAL NOT NULL,
    "month"                    INT       NOT NULL,
    "year"                     INT       NOT NULL,
    "municipality_id"          BIGINT    NOT NULL,
    "catch_schedule_status_id" BIGINT    NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE catch_schedule IS 'План-график отлова';
COMMENT ON COLUMN catch_schedule.id                       IS 'Идентификатор план-график отлова';
COMMENT ON COLUMN catch_schedule.month                    IS 'Месяц';
COMMENT ON COLUMN catch_schedule.year                     IS 'Год';
COMMENT ON COLUMN catch_schedule.municipality_id          IS 'Идентификатор муниципального образования';
COMMENT ON COLUMN catch_schedule.catch_schedule_status_id IS 'Статус плана-графика';

ALTER TABLE catch_schedule ADD CONSTRAINT fk__catch_schedule___municipality FOREIGN KEY (municipality_id) REFERENCES dic_municipality;
ALTER TABLE catch_schedule ADD CONSTRAINT fk__catch_schedule___catch_schedule_status FOREIGN KEY (catch_schedule_status_id) REFERENCES catch_schedule_status;