-- DML (Data Manipulation Language)

/*

  что возвращают DML-операции

  select field_id, field_name from table;                                                     - данные
  insert into table (field_id, field_name) values (id, value);                                - количество добавленных данных
  update table set field_name = value where field_id = id;                                    - количество изменённых данных
  delete from table where field_id = id;                                                      - количество удалённых данных

  insert into table (field_id, field_name) values (id, value) returning field_id, field_name; - данные добавленной строки
  update table set field_name = value where field_id = id returning field_id, field_name;     - данные изменённой строки
  delete from table where field_id = id returning field_id, field_name;                       - данные удалённой строки

*/

-- selects

select * from race order by id;
select * from distance order by id;
select * from registration order by id;

-- inserts into race

insert into race (is_active, race_date, race_name, race_city, race_address, description) values
    (true, '2025-02-22 12:00:00.000000', 'Забег настоящих мужчин', 'Москва', 'Перовский сквер', null),
    (true, '2025-03-01 10:00:00.000000', 'Кубковая эстафета "Звёздный путь"', 'Москва', 'Манеж "Спартак"', null);

-- inserts into distance

insert into distance (race_id, distance_name, entrance_fee, entrance_currency, racer_limit) values
    (1, 'FULL', 1400.00, 'RUB', null),
    (1, 'HALF', 1200.00, 'RUB', null),
    (1, 'TEN', 1000.00, 'RUB', null),
    (1, 'FIVE', 800.00, 'RUB', null),
    (2, 'TEN', null, null, 5),
    (2, 'FIVE', null, null, 5);

-- inserts into registration

insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (1, '2025-02-01 15:16:01.000000', 'PENDING_PAYMENT', 'Петров', 'Василий', 'Александрович', '1985-04-17 00:00:00.000000', 'MALE', 'petrov_va@mail.ru', '9999999999', null);
insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (1, '2025-02-02 10:05:35.000000', 'PENDING_PAYMENT','Волков', 'Сергей', 'Петрович', '1995-08-01 00:00:00.000000', 'MALE', 'volkov_sp@mail.ru', '9999999998', null);
insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (2, '2025-02-03 22:27:10.000000', 'PENDING_PAYMENT', 'Сидоров', 'Алексей', 'Михайлович', '1995-08-01 00:00:00.000000', 'MALE', 'sidorov_am@mail.ru', '9999999997', null);
insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (6, '2025-02-04 17:12:30.000000', 'ACCEPTED', 'Андреева', 'Дарья', 'Сергеевна', '1991-11-12 00:00:00.000000', 'FEMALE', 'andreeva_ds@mail.ru', '9999999996', null);
insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (5, '2025-02-05 09:08:56.000000', 'ACCEPTED', 'Петров', 'Василий', 'Александрович', '1985-04-17 00:00:00.000000', 'MALE', 'petrov_va@mail.ru', '9999999999', null);
insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (5, '2025-02-06 11:12:07.000000', 'ACCEPTED', 'Борисова', 'Екатерина', 'Андреевна', '1997-05-19 00:00:00.000000', 'FEMALE', 'borisova_ea@mail.ru', '9999999995', null);
insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (5, '2025-02-07 14:57:39.000000', 'ACCEPTED', 'Смирнова', 'Татьяна', 'Васильевна', '2001-01-30 00:00:00.000000', 'FEMALE', 'smirnova_tv@mail.ru', '9999999994', null);
insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (5, '2025-02-08 12:47:13.000000', 'ACCEPTED', 'Кузнецова', 'Надежда', 'Игоревна', '2002-02-17 00:00:00.000000', 'FEMALE', 'kuznetsova_ni@mail.ru', '9999999993', null);
insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (5, '2025-02-09 16:34:05.000000', 'ACCEPTED', 'Архипова', 'Ольга', 'Михайловна', '2005-07-01 00:00:00.000000', 'FEMALE', 'arkhipova_om@mail.ru', '9999999992', null);
insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (5, '2025-02-10 07:08:22.000000', 'ACCEPTED', 'Комарова', 'Юлия', 'Игоревна', '2001-09-16 00:00:00.000000', 'FEMALE', 'komarova_yi@mail.ru', '9999999991', null);

-- call add_registration

call add_registration(1, '2025-02-01 15:16:01.000000', 'Петров', 'Василий', 'Александрович', '1985-04-17 00:00:00.000000', 'MALE', 'petrov_va@mail.ru', '9999999999', null);
call add_registration(1, '2025-02-02 10:05:35.000000', 'Волков', 'Сергей', 'Петрович', '1995-08-01 00:00:00.000000', 'MALE', 'volkov_sp@mail.ru', '9999999998', null);
call add_registration(2, '2025-02-03 22:27:10.000000', 'Сидоров', 'Алексей', 'Михайлович', '1995-08-01 00:00:00.000000', 'MALE', 'sidorov_am@mail.ru', '9999999997', null);
call add_registration(6, '2025-02-04 17:12:30.000000', 'Андреева', 'Дарья', 'Сергеевна', '1991-11-12 00:00:00.000000', 'FEMALE', 'andreeva_ds@mail.ru', '9999999996', null);
call add_registration(5, '2025-02-05 09:08:56.000000', 'Петров', 'Василий', 'Александрович', '1985-04-17 00:00:00.000000', 'MALE', 'petrov_va@mail.ru', '9999999999', null);
call add_registration(5, '2025-02-06 11:12:07.000000', 'Борисова', 'Екатерина', 'Андреевна', '1997-05-19 00:00:00.000000', 'FEMALE', 'borisova_ea@mail.ru', '9999999995', null);
call add_registration(5, '2025-02-07 14:57:39.000000', 'Смирнова', 'Татьяна', 'Васильевна', '2001-01-30 00:00:00.000000', 'FEMALE', 'smirnova_tv@mail.ru', '9999999994', null);
call add_registration(5, '2025-02-08 12:47:13.000000', 'Кузнецова', 'Надежда', 'Игоревна', '2002-02-17 00:00:00.000000', 'FEMALE', 'kuznetsova_ni@mail.ru', '9999999993', null);
call add_registration(5, '2025-02-09 16:34:05.000000', 'Архипова', 'Ольга', 'Михайловна', '2005-07-01 00:00:00.000000', 'FEMALE', 'arkhipova_om@mail.ru', '9999999992', null);
call add_registration(5, '2025-02-10 07:08:22.000000', 'Комарова', 'Юлия', 'Игоревна', '2001-09-16 00:00:00.000000', 'FEMALE', 'komarova_yi@mail.ru', '9999999991', null);

-- call delete_registration

call delete_registration(9);

-- deletes

delete from registration;
delete from distance;
delete from race;