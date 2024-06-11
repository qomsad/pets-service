CREATE TABLE catch_schedule_status (
    "id"          BIGSERIAL    NOT NULL,
    "record_name" VARCHAR(255) NOT NULL,
    PRIMARY KEY ("id")
);

INSERT INTO catch_schedule_status (id, record_name) VALUES 
    ('Не действует'),
    ('В исполнении'),
    ('Исполнен'),
    ('Истёк без отлова');