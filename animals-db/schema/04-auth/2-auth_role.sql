CREATE TABLE auth_role (
    "id"        BIGSERIAL NOT NULL,
    "role_name" TEXT      NOT NULL,
    PRIMARY KEY ("id")
);

COMMENT ON TABLE auth_role IS 'Роли пользователей системы';
COMMENT ON COLUMN auth_role.id        IS 'Идентификатор роли';
COMMENT ON COLUMN auth_role.role_name IS 'Название роли';

ALTER TABLE auth_role ADD CONSTRAINT uk__role_name UNIQUE (role_name);

INSERT INTO auth_role (id, role_name) VALUES 
    (1, 'Любая роль'),
    (2, 'Гость'),
    (3, 'Супер админ с полным доступом'),
    (4, 'Просмотр всего без права редактирования'),
    (5, 'Куратор Ветслужбы'),
    (6, 'Оператор Ветслужбы'),
    (7, 'Подписант Ветслужбы'),
    (8, 'Куратор ОМСУ'),
    (9, 'Оператор ОМСУ'),
    (10, 'Подписант ОМСУ'),
    (11, 'Куратор по отлову'),
    (12, 'Оператор по отлову'),
    (13, 'Подписант по отлову'),
    (14, 'Куратор приюта'),
    (15, 'Оператор приюта'),
    (16, 'Подписант приюта');
	
ALTER SEQUENCE auth_role_id_seq RESTART WITH 17;