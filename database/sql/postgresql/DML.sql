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

select * from auto_pk_support;
select * from race;
select * from distance;
select * from registration;

-- inserts into auto_pk_support

insert into auto_pk_support (table_name, last_id) values
    ('race', 0),
    ('distance', 0),
    ('registration', 0);

-- inserts into race

update auto_pk_support set last_id = last_id + 1 where table_name = 'race' returning last_id;

insert into race (id, is_active, race_date, race_name, race_city, race_address, description) values
    (1, true, '2025-02-22 12:00:00.000000', 'Забег настоящих мужчин', 'Москва', 'Перовский сквер', null);

-- inserts into distance

update auto_pk_support set last_id = last_id + 1 where table_name = 'distance' returning last_id;

insert into distance (id, race_id, distance_name, entrance_fee, entrance_currency, racer_limit_left) values
    (1, 1, 'FULL', 1400.00, 'RUB', null);

-- inserts into registration

update auto_pk_support set last_id = last_id + 1 where table_name = 'registration' returning last_id;

insert into registration (id, distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (1, 1, '2025-02-01 15:16:01.000000', 'PENDING_PAYMENT', 'Петров', 'Василий', 'Александрович', to_date('19850417', 'yyyymmdd'), 'MALE', 'petrov_va@mail.ru', '9999999999', null);

-- deletes

delete from auto_pk_support;
delete from registration;
delete from distance;
delete from race;