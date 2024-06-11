CREATE TABLE auth_privileges (
    "id"           BIGSERIAL   NOT NULL,
    "registry"     VARCHAR(50) NOT NULL,
    "privileges"   VARCHAR(6)  NOT NULL,
    "category"     TEXT        NOT NULL,
    PRIMARY KEY (id)
);

COMMENT ON TABLE auth_privileges IS 'Привилегии на информационные объекты';
COMMENT ON COLUMN auth_privileges.id         IS 'Идентификатор привилегии';
COMMENT ON COLUMN auth_privileges.registry   IS 'Реестр информационных объектов, на который назначается привилегия';
COMMENT ON COLUMN auth_privileges.privileges IS 'Тип привилегии';
COMMENT ON COLUMN auth_privileges.category   IS 'Категория объектов';

INSERT INTO auth_privileges (id, registry, privileges, category) VALUES
    (1, 'ORGANIZATION', 'SELECT', 'ALL'),
    (2, 'ORGANIZATION', 'INSERT', 'ALL'),
    (3, 'ORGANIZATION', 'UPDATE', 'ALL'),
    (4, 'ORGANIZATION', 'DELETE', 'ALL'),
    (5, 'ORGANIZATION', 'SELECT', 'ORG'),
    (6, 'ORGANIZATION', 'INSERT', 'ORG'),
    (7, 'ORGANIZATION', 'UPDATE', 'ORG'),
    (8, 'ORGANIZATION', 'DELETE', 'ORG'),
    (9, 'ORGANIZATION', 'SELECT', 'MUN'),
    (10, 'ORGANIZATION', 'INSERT', 'MUN'),
    (11, 'ORGANIZATION', 'UPDATE', 'MUN'),
    (12, 'ORGANIZATION', 'DELETE', 'MUN'),
    (13, 'CONTRACT', 'SELECT', 'ALL'),
    (14, 'CONTRACT', 'INSERT', 'ALL'),
    (15, 'CONTRACT', 'UPDATE', 'ALL'),
    (16, 'CONTRACT', 'DELETE', 'ALL'),
    (17, 'CONTRACT', 'SELECT', 'ORG'),
    (18, 'CONTRACT', 'INSERT', 'ORG'),
    (19, 'CONTRACT', 'UPDATE', 'ORG'),
    (20, 'CONTRACT', 'DELETE', 'ORG'),
    (21, 'CONTRACT', 'SELECT', 'MUN'),
    (22, 'CONTRACT', 'INSERT', 'MUN'),
    (23, 'CONTRACT', 'UPDATE', 'MUN'),
    (24, 'CONTRACT', 'DELETE', 'MUN'),
    (25, 'CATCH_ACT', 'SELECT', 'ALL'),
    (26, 'CATCH_ACT', 'INSERT', 'ALL'),
    (27, 'CATCH_ACT', 'UPDATE', 'ALL'),
    (28, 'CATCH_ACT', 'DELETE', 'ALL'),
    (29, 'CATCH_ACT', 'SELECT', 'ORG'),
    (30, 'CATCH_ACT', 'INSERT', 'ORG'),
    (31, 'CATCH_ACT', 'UPDATE', 'ORG'),
    (32, 'CATCH_ACT', 'DELETE', 'ORG'),
    (33, 'CATCH_ACT', 'SELECT', 'MUN'),
    (34, 'CATCH_ACT', 'INSERT', 'MUN'),
    (35, 'CATCH_ACT', 'UPDATE', 'MUN'),
    (36, 'CATCH_ACT', 'DELETE', 'MUN'),
    (37, 'CATCH_SCHEDULE', 'SELECT', 'ALL'),
    (38, 'CATCH_SCHEDULE', 'INSERT', 'ALL'),
    (39, 'CATCH_SCHEDULE', 'UPDATE', 'ALL'),
    (40, 'CATCH_SCHEDULE', 'DELETE', 'ALL'),
    (41, 'CATCH_SCHEDULE', 'SELECT', 'ORG'),
    (42, 'CATCH_SCHEDULE', 'INSERT', 'ORG'),
    (43, 'CATCH_SCHEDULE', 'UPDATE', 'ORG'),
    (44, 'CATCH_SCHEDULE', 'DELETE', 'ORG'),
    (45, 'CATCH_SCHEDULE', 'SELECT', 'MUN'),
    (46, 'CATCH_SCHEDULE', 'INSERT', 'MUN'),
    (47, 'CATCH_SCHEDULE', 'UPDATE', 'MUN'),
    (48, 'CATCH_SCHEDULE', 'DELETE', 'MUN'),
    (49, 'REPORT_MUNICIPALITY', 'SELECT', 'ALL'),
    (50, 'REPORT_MUNICIPALITY', 'INSERT', 'ALL'),
    (51, 'REPORT_MUNICIPALITY', 'UPDATE', 'ALL'),
    (52, 'REPORT_MUNICIPALITY', 'DELETE', 'ALL');

ALTER SEQUENCE auth_privileges_id_seq RESTART WITH 53;

