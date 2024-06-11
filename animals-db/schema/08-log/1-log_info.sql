CREATE TABLE log_info (
    "id"             BIGSERIAL NOT NULL,
    "entity_id"      BIGINT,
    "entity_name"    TEXT,
    "description"    TEXT,
    "request_method" TEXT,
    "request_path"   TEXT,
    "request_query"  TEXT,
    "request_body"   TEXT,
    "api_response"   TEXT,
    "log_level"      TEXT,
    "login"          TEXT,
    "date_time"      TIMESTAMP,
    PRIMARY KEY (id)
);

COMMENT ON TABLE log_info IS 'Журнал операций';
COMMENT ON COLUMN log_info.id             IS 'Идентификатор операции';
COMMENT ON COLUMN log_info.entity_id      IS 'Идентификатор информационного объекта';
COMMENT ON COLUMN log_info.entity_name    IS 'Название информационного объекта';
COMMENT ON COLUMN log_info.description    IS 'Описание метода';
COMMENT ON COLUMN log_info.request_method IS 'Метод запроса';
COMMENT ON COLUMN log_info.request_path   IS 'Запрос';
COMMENT ON COLUMN log_info.request_query  IS 'Параметры запроса';
COMMENT ON COLUMN log_info.request_body   IS 'Тело запроса';
COMMENT ON COLUMN log_info.api_response   IS 'Ответ';
COMMENT ON COLUMN log_info.log_level      IS 'Уровень записи в журнале';
COMMENT ON COLUMN log_info.login          IS 'Пользователь выполнивший операцию';
COMMENT ON COLUMN log_info.date_time      IS 'Дата и время запроса';