CREATE TABLE auth_user_role (
    "role_id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    PRIMARY KEY ("role_id", "user_id")
);

COMMENT ON TABLE auth_user_role IS 'Роли назначенные пользователям';
COMMENT ON COLUMN auth_user_role.role_id IS 'Идентификатор роли';
COMMENT ON COLUMN auth_user_role.user_id IS 'Идентификатор пользователя';

ALTER TABLE auth_user_role ADD CONSTRAINT fk__auth_user_role___role FOREIGN KEY (role_id) REFERENCES auth_role;
ALTER TABLE auth_user_role ADD CONSTRAINT fk__auth_user_role___user FOREIGN KEY (user_id) REFERENCES auth_user;