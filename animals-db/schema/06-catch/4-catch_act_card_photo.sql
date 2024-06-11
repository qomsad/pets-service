CREATE TABLE catch_act_card_photo (
    "id"        BIGSERIAL NOT NULL,
    "card_id"   BIGINT    NOT NULL,
    "file_name" TEXT      NOT NULL,
    "file_path" TEXT      NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE catch_act_card_photo IS 'Фото и видео материал процесса отлова';
COMMENT ON COLUMN catch_act_card_photo.id        IS 'Идентификатор фото или видео';
COMMENT ON COLUMN catch_act_card_photo.card_id   IS 'Идентификатор карточки отлова, которой принадлежит файл';
COMMENT ON COLUMN catch_act_card_photo.file_name IS 'Имя файла при загрузке';
COMMENT ON COLUMN catch_act_card_photo.file_path IS 'Расположение файла в файловом хранилище';

ALTER TABLE catch_act_card_photo ADD CONSTRAINT fk__catch_act_card_photo___card FOREIGN KEY (card_id) REFERENCES catch_act_card ON DELETE CASCADE;