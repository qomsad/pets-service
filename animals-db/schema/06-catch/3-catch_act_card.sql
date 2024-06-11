CREATE TABLE catch_act_card (
    "id"              BIGSERIAL    NOT NULL,
    "act_id"          BIGINT       NOT NULL,
    "animal_chip"     VARCHAR(255)         ,
    "animal_tag"      VARCHAR(255)         ,
    "animal_breed"    TEXT                 ,
    "animal_color"    TEXT                 ,
    "animal_ears"     BIGINT               ,
    "animal_gender"   BOOLEAN      NOT NULL,
    "animal_hair"     BIGINT               ,
    "animal_category" BIGINT       NOT NULL,
    "animal_size"     BIGINT               ,
    "animal_signs"    TEXT                 ,
    "animal_tail"     BIGINT               ,
    "owner_sign"      BIGINT       NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE catch_act_card IS 'Карточки учёта отловленных животных';
COMMENT ON COLUMN catch_act_card.id              IS 'Идентификатор карточки учёта';
COMMENT ON COLUMN catch_act_card.act_id          IS 'Акт отлова';
COMMENT ON COLUMN catch_act_card.animal_chip     IS 'Номер электронного чипа';
COMMENT ON COLUMN catch_act_card.animal_tag      IS 'Идентификационная метка';
COMMENT ON COLUMN catch_act_card.animal_breed    IS 'Порода животного';
COMMENT ON COLUMN catch_act_card.animal_color    IS 'Окрас';
COMMENT ON COLUMN catch_act_card.animal_ears     IS 'Уши';
COMMENT ON COLUMN catch_act_card.animal_gender   IS 'Пол';
COMMENT ON COLUMN catch_act_card.animal_hair     IS 'Шерсть';
COMMENT ON COLUMN catch_act_card.animal_category IS 'Вид животного';
COMMENT ON COLUMN catch_act_card.animal_size     IS 'Размер';
COMMENT ON COLUMN catch_act_card.animal_signs    IS 'Характеристики животного';
COMMENT ON COLUMN catch_act_card.animal_tail     IS 'Хвост';

ALTER TABLE catch_act_card ADD CONSTRAINT fk__catch_act_card___catch_act FOREIGN KEY (act_id) REFERENCES catch_act ON DELETE CASCADE;
ALTER TABLE catch_act_card ADD CONSTRAINT fk__catch_act_card___animal_ears FOREIGN KEY (animal_ears) REFERENCES dic_animal_ears;
ALTER TABLE catch_act_card ADD CONSTRAINT fk__catch_act_card___animal_hair FOREIGN KEY (animal_hair) REFERENCES dic_animal_hair;
ALTER TABLE catch_act_card ADD CONSTRAINT fk__catch_act_card___animal_category FOREIGN KEY (animal_category) REFERENCES dic_animal_category;
ALTER TABLE catch_act_card ADD CONSTRAINT fk__catch_act_card___animal_size FOREIGN KEY (animal_size) REFERENCES dic_animal_size;
ALTER TABLE catch_act_card ADD CONSTRAINT fk__catch_act_card___animal_tail FOREIGN KEY (animal_tail) REFERENCES dic_animal_tail;
ALTER TABLE catch_act_card ADD CONSTRAINT fk__catch_act_card___owner_sign FOREIGN KEY (owner_sign) REFERENCES dic_owner_sign;