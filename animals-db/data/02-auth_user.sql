INSERT INTO auth_user ("first_name", "middle_name", "last_name", "email", "phone", "login", "password", "organization_id", "municipality_id") VALUES
('Админ', '', 'Супер', '', '', 'admin', 'admin_g', NULL, NULL),
('Гость', '', '', '', '', 'anon', 'anon_g', NULL, NULL);

-- Ветслужба
INSERT INTO auth_user ("first_name", "middle_name", "last_name", "email", "phone", "login", "password", "organization_id", "municipality_id") VALUES
('Захар', 'Владиславович', 'Беляев', 'beljaev@mail.ru', '+791234567890', 'opervet', 'opervet_g', 2, 4),
('Елизавета', 'Егоровна', 'Воробьева', 'vorobeva@mail.ru', '+791234567890', 'curvet', 'curvet_g', 2, 4),
('Лев', 'Егорович', 'Ткачев', 'tkachev@mail.ru', '+791234567890', 'podvet', 'podvet_g', 2, 4);

-- ОМСУ
INSERT INTO auth_user ("first_name", "middle_name", "last_name", "email", "phone", "login", "password", "organization_id", "municipality_id") VALUES
('Виктория', 'Робертовна', 'Леонтьева', 'leonteva@mail.ru', '+791234567890', 'curtyumen', 'curtyumen_g', 1, 4),
('Алексей', 'Михайлович', 'Григорьев', 'grigorev@mail.ru', '+791234567890', 'curtobol', 'curtobol_g', 3, 3),
('Никита', 'Александрович', 'Орлов', 'orlov@mail.ru', '+791234567890', 'curarmiz', 'curarmiz_g', 4, 6),
('Мария', 'Вячеславовна', 'Пастухова', 'pastuhova@mail.ru', '+791234567890', 'curgol', 'curgol_g', 5, 7),
('Макар', 'Ильич', 'Филиппов', 'filippov@mail.ru', '+791234567890', 'curishim', 'curishim_g', 7, 2),
('Виктор', 'Тимофеевич', 'Громов', 'gromov@mail.ru', '+791234567890', 'opertyumen', 'opertyumen_g', 1, 4),
('Есения', 'Николаевна', 'Сычева', 'sycheva@mail.ru', '+791234567890', 'opergol', 'opergol_g', 5, 7);

-- Приюты
INSERT INTO auth_user ("first_name", "middle_name", "last_name", "email", "phone", "login", "password", "organization_id", "municipality_id") VALUES
('Юлия', 'Альбертовна', 'Ситникова', 'sitnikova@mail.ru', '+791234567890', 'sitnikova', 'sitnikova_g', 10, 2),
('Константин', 'Аркадьевич', 'Давлетов', 'davletovka@mail.ru', '+791234567890', 'davletovc', 'davletovc_g', 22, 7),
('Полина', 'Дмитриевна', 'Васильева', 'vasileva@mail.ru', '+791234567890', 'davletovo', 'davletovo_g', 22, 7),
('Лада', 'Николаевна', 'Худякова', 'hudjakova@mail.ru', '+791234567890', 'davletovp', 'davletovp_g', 22, 7),
('Леонид', 'Данилович', 'Соловьев', 'solovev@mail.ru', '+791234567890', 'davletovkac', 'davletovkac_g', 22, 7),
('Никита', 'Георгиевич', 'Богданов', 'bogdanov@mail.ru', '+791234567890', 'davletovkao', 'davletovkao_g', 22, 7),
('Виктор', 'Александрович', 'Зайцев', 'zajcev@mail.ru', '+791234567890', 'davletovkap', 'davletovkap_g', 22, 7),
('Иван', 'Иваныч', 'Иванов', 'ivanov@mail.ru', '+791234567890', 'ivanov', 'ivanov_g', 23, 3),
('Леонид', 'Петрович', 'Сидоров', 'sidorov@mail.ru', '+791234567890', 'sidorov', 'sidorov_g', 24, 4),
('Дарья', 'Сергеевна', 'Петрова', 'petrova@mail.ru', '+791234567890', 'petrova', 'petrova_g', 25, 4),
('Владимир', 'Георгиевич', 'Демидов', 'demidov@mail.ru', '+791234567890', 'demidov', 'demidov_g', 28, 2),
('Егор', 'Ярославович', 'Воронин', 'voronin@mail.ru', '+791234567890', 'voronin', 'voronin_g', 30, 7);
