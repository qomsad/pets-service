CREATE TABLE auth_user (
    "id"                BIGSERIAL   NOT NULL,
    "first_name"        TEXT        NOT NULL,
    "middle_name"       TEXT                ,
    "last_name"         TEXT        NOT NULL,
    "email"             TEXT                ,
    "phone"             TEXT                ,
    "login"             TEXT        NOT NULL,
    "password"          VARCHAR(64) NOT NULL,
    "organization_id"   BIGINT              ,
    "municipality_id"   BIGINT              ,
    "role_id"           BIGINT      NOT NULL,
    PRIMARY KEY ("id")
);

COMMENT ON TABLE auth_user IS 'Пользователи системы';
COMMENT ON COLUMN auth_user.id                IS 'Идентификатор пользователя';
COMMENT ON COLUMN auth_user.first_name        IS 'Имя';
COMMENT ON COLUMN auth_user.middle_name       IS 'Отчество';
COMMENT ON COLUMN auth_user.last_name         IS 'Фамилия';
COMMENT ON COLUMN auth_user.email             IS 'E-mail';
COMMENT ON COLUMN auth_user.phone             IS 'Телефон';
COMMENT ON COLUMN auth_user.login             IS 'Логин';
COMMENT ON COLUMN auth_user.organization_id   IS 'Организация пользователя';
COMMENT ON COLUMN auth_user.municipality_id   IS 'Муниципальное образование пользователя';
COMMENT ON COLUMN auth_user.role_id           IS 'Роль пользователя'

ALTER TABLE auth_user ADD CONSTRAINT uk__login unique (login);