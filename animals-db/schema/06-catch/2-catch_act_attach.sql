CREATE TABLE catch_act_attach (
    "id"        BIGSERIAL NOT NULL,
    "act_id"    BIGINT    NOT NULL,
    "file_name" TEXT      NOT NULL,
    "file_path" TEXT      NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE catch_act_attach IS 'Скан-образы акта отлова';
COMMENT ON COLUMN catch_act_attach.id        IS 'Идентификатор скан-образа';
COMMENT ON COLUMN catch_act_attach.act_id    IS 'Идентификатор акта отлова, которому принадлежит скан-образ';
COMMENT ON COLUMN catch_act_attach.file_name IS 'Имя файла при загрузке';
COMMENT ON COLUMN catch_act_attach.file_path IS 'Расположение файла в файловом хранилище';

ALTER TABLE catch_act_attach ADD CONSTRAINT fk__catch_act_attach___catch_act FOREIGN KEY (act_id) REFERENCES catch_act ON DELETE CASCADE;