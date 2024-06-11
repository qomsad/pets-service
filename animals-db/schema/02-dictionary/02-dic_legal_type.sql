CREATE TABLE dic_legal_type (
    "id"          BIGSERIAL    NOT NULL,
    "record_name" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO dic_legal_type (id, record_name) VALUES
    ('Юридическое лицо'),
    ('Индивидуальный предприниматель');