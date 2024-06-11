CREATE TABLE catch_schedule_act (
    "catch_schedule_id" BIGINT NOT NULL,
    "catch_act_id"      BIGINT NOT NULL
);

COMMENT ON TABLE catch_schedule_act IS 'Отлов, который произведен по плану';
COMMENT ON COLUMN catch_schedule_act.catch_schedule_id IS 'Идентификатор план-графика';
COMMENT ON COLUMN catch_schedule_act.catch_act_id      IS 'Идентификатор акта отлова';

ALTER TABLE catch_schedule_act ADD CONSTRAINT fk__catch_schedule_act___catch_act FOREIGN KEY (catch_act_id) REFERENCES catch_act;
ALTER TABLE catch_schedule_act ADD CONSTRAINT fk__catch_schedule_act___catch_schedule FOREIGN KEY (catch_schedule_id) REFERENCES catch_schedule;
ALTER TABLE catch_schedule_act ADD CONSTRAINT uk__catch_schedule_id___catch_act_id UNIQUE (catch_schedule_id, catch_act_id);