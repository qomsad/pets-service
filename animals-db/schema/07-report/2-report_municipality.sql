CREATE TABLE report_municipality (
    "id"                            BIGSERIAL    NOT NULL,
    "report_name"                   VARCHAR(255) NOT NULL,
    "municipality_id"               BIGINT       NOT NULL,
    "start_date"                    DATE         NOT NULL,
    "end_date"                      DATE         NOT NULL,
    "catch_count"                   INTEGER      NOT NULL,
    "full_cost"                     FLOAT8       NOT NULL,
    "report_municipality_status_id" BIGINT       NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE report_municipality IS 'Отчет по муниципалитетам';
COMMENT ON COLUMN report_municipality.id                            IS 'Идентификатор отчета';
COMMENT ON COLUMN report_municipality.report_name                   IS 'Имя отчета';
COMMENT ON COLUMN report_municipality.municipality_id               IS 'Идентификатор муниципального образования';
COMMENT ON COLUMN report_municipality.start_date                    IS 'Начало периода';
COMMENT ON COLUMN report_municipality.end_date                      IS 'Конец периода';
COMMENT ON COLUMN report_municipality.report_municipality_status_id IS 'Статус отчета';

ALTER TABLE report_municipality ADD CONSTRAINT fk__report_municipality___municipality FOREIGN KEY (municipality_id) REFERENCES dic_municipality;
ALTER TABLE report_municipality ADD CONSTRAINT fk__report_municipality___report_municipality_status FOREIGN KEY (report_municipality_status_id) REFERENCES report_municipality_status;