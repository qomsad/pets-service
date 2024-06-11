CREATE TABLE dic_municipality (
    "id"          BIGSERIAL    NOT NULL,
    "record_name" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO dic_municipality (id, record_name) VALUES
    ('г. Заводоуковск'),
    ('г. Ишим'),
    ('г. Тобольск'),
    ('г. Тюмень'),
    ('г. Ялуторовск'),
    ('с. Армизонское'),
    ('п. Голышманово'),
    ('с. Нижняя Тавда'),
    ('с. Омутинское'),
    ('с. Сладково' ),
    ('с. Уват'),
    ('с. Упорово'),
    ('с. Юргинское'),
    ('с. Ярково');