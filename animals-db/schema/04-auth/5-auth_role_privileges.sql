CREATE TABLE auth_role_privileges (
    "role_id"       INT8 NOT NULL,
    "privileges_id" INT8 NOT NULL,
    PRIMARY KEY ("role_id","privileges_id")
);

COMMENT ON TABLE auth_role_privileges IS 'Привилегии доступные ролям';
COMMENT ON COLUMN auth_role_privileges.role_id       IS 'Идентификатор роли';
COMMENT ON COLUMN auth_role_privileges.privileges_id IS 'Идентификатор привилегии';

ALTER TABLE auth_role_privileges ADD CONSTRAINT fk__auth_role_privileges___privileges FOREIGN KEY (privileges_id) REFERENCES auth_privileges;
ALTER TABLE auth_role_privileges ADD CONSTRAINT fk__auth_role_privileges___role FOREIGN KEY (role_id) REFERENCES auth_role;

-- Базовые привилегии
INSERT INTO auth_role_privileges (role_id, privileges_id) VALUES
    -- Супер админ с полным доступом
    (3, 1),
    (3, 2),
    (3, 3),
    (3, 4),
    (3, 5),
    (3, 6),
    (3, 7),
    (3, 8),
    (3, 9),
    (3, 10),
    (3, 11),
    (3, 12),
    (3, 13),
    (3, 14),
    (3, 15),
    (3, 16),
    (3, 17),
    (3, 18),
    (3, 19),
    (3, 20),
    (3, 21),
    (3, 22),
    (3, 23),
    (3, 24),
    (3, 25),
    (3, 26),
    (3, 27),
    (3, 28),
    (3, 29),
    (3, 30),
    (3, 31),
    (3, 32),
    (3, 33),
    (3, 34),
    (3, 35),
    (3, 36),
    (3, 37),
    (3, 38),
    (3, 39),
    (3, 40),
    (3, 41),
    (3, 42),
    (3, 43),
    (3, 44),
    (3, 45),
    (3, 46),
    (3, 47),
    (3, 48),
    (3, 49),
    (3, 50),
    (3, 51),
    (3, 52),
    -- Просмотр всего без права редактирования
    (4, 1),
    (4, 5),
    (4, 9),
    (4, 13),
    (4, 17),
    (4, 21),
    (4, 25),
    (4, 29),
    (4, 33),
    (4, 37),
    (4, 41),
    (4, 45),
    (4, 49);

-- Реестр организаций
INSERT INTO auth_role_privileges (role_id, privileges_id) VALUES
    -- Куратор по отлову
    (11, 1),
    (11, 5),
    (11, 9),
    -- Куратор приюта
    (14, 1),
    (14, 5),
    (14, 9),
    -- Подписант Ветслужбы
    (7, 1),
    (7, 5),
    (7, 9),
    -- Подписант по отлову
    (13, 1),
    (13, 5),
    (13, 9),
    -- Подписант приюта
    (16, 1),
    (16, 5),
    (16, 9),
    -- Куратор ОМСУ
    (8, 1),
    (8, 5),
    (8, 9),
    -- Подписант ОМСУ
    (10, 1),
    (10, 5),
    (10, 9),
    -- Оператор Ветслужбы
    (6, 1),
    (6, 2),
    (6, 3),
    (6, 4),
    (6, 5),
    (6, 6),
    (6, 7),
    (6, 8),
    (6, 9),
    (6, 10),
    (6, 11),
    (6, 12),
    -- Оператор ОМСУ
    (9, 1),
    (9, 2),
    (9, 3),
    (9, 4),
    (9, 5),
    (9, 6),
    (9, 7),
    (9, 8),
    (9, 9),
    (9, 10),
    (9, 11),
    (9, 12);

-- Реестр контрактов
INSERT INTO auth_role_privileges (role_id, privileges_id) VALUES
    -- Куратор Ветслужбы
    (5, 13),
    (5, 17),
    (5, 21),
    -- Оператор Ветслужбы
    (6, 13),
    (6, 17),
    (6, 21),
    -- Подписант Ветслужбы
    (7, 13),
    (7, 17),
    (7, 21),
    -- Куратор приюта
    (14, 17),
    -- Куратор по отлову
    (11, 17),
    -- Подписант приюта
    (16, 17),
    -- Подписант по отлову
    (13, 17),
    -- Куратор ОМСУ
    (8, 21),
    -- Подписант ОМСУ
    (10, 21),
    -- Оператор ОМСУ
    (9, 21),
    (9, 22),
    (9, 23),
    (9, 24);

-- Реестр актов отлова
INSERT INTO auth_role_privileges (role_id, privileges_id) VALUES
    -- Оператор по отлову
    (12, 29),
    (12, 30),
    (12, 31),
    (12, 32),
    -- Куратор Ветслужбы
    (5, 25),
    (5, 29),
    (5, 33),
    -- Куратор приюта
    (14, 25),
    (14, 29),
    (14, 33),
    -- Оператор Ветслужбы
    (6, 25),
    (6, 29),
    (6, 33),
    -- Оператор приюта
    (15, 25),
    (15, 29),
    (15, 33),
    -- Подписант Ветслужбы
    (7, 25),
    (7, 29),
    (7, 33),
    -- Подписант приюта
    (16, 25),
    (16, 29),
    (16, 33),
    -- Куратор ОМСУ
    (8, 33),
    -- Оператор ОМСУ
    (9, 33),
    -- Подписант ОМСУ
    (10, 33),
    -- Куратор по отлову
    (11, 29),
    -- Подписант по отлову
    (13, 29);

-- Реестр планов-графиков
INSERT INTO auth_role_privileges (role_id, privileges_id) VALUES
    -- Куратор Ветслужбы
    (5, 37),
    (5, 41),
    (5, 45),
    -- Оператор Ветслужбы
    (6, 37),
    (6, 41),
    (6, 45),
    -- Подписант Ветслужбы
    (7, 37),
    (7, 41),
    (7, 45),
    -- Оператор ОМСУ
    (9, 45),
    -- Оператор по отлову
    (12, 41),
    (12, 42),
    (12, 43),
    (12, 44);

-- Реестр статистики по городам
INSERT INTO auth_role_privileges (role_id, privileges_id) VALUES
    -- Куратор ОМСУ
    (8, 49),
    (8, 50),
    (8, 51),
    (8, 52),
    -- Оператор ОМСУ
    (9, 49),
    (9, 50),
    (9, 51),
    (9, 52),
    -- Подписант ОМСУ
    (10, 49),
    (10, 50),
    (10, 51),
    (10, 52);