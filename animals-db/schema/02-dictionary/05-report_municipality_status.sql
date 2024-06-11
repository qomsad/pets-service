CREATE TABLE report_municipality_status (
    "id"          BIGSERIAL    NOT NULL,
    "record_name" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO report_municipality_status (id, record_name) VALUES
    ('Черновик'),
    ('Доработка'),
    ('Согласование у исполнителя Муниципального Контракта'),
    ('Согласован у исполнителя Муниципального Контракта'),
    ('Утвержден у исполнителя Муниципального Контракта'),
    ('Согласован в ОМСУ');
