-- CRUD (Create Read Update Delete) for registration

-- inserts (Create)

-- добавить запись со всеми полями

insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (1, '2025-02-01 15:16:01.000000', 'PENDING_PAYMENT', 'Петров', 'Василий', 'Александрович', '1985-04-17 00:00:00.000000', 'MALE', 'petrov_va@mail.ru', '9999999999', null);

-- selects (Read)

-- найти все записи

select
    id,
    distance_id,
    creation_date,
    status,
    last_name,
    first_name,
    middle_name,
    birth_date,
    gender,
    email,
    mobile_phone,
    delete_reason
from
    registration;

-- найти с постраничной разбивкой условие where и лимит

-- определяем количество страниц

select count(*) from registration;

-- передаём в запрос максимальный идентификатор с прошлой страницы или 0 для первой

select
    id,
    distance_id,
    creation_date,
    status,
    last_name,
    first_name,
    middle_name,
    birth_date,
    gender,
    email,
    mobile_phone,
    delete_reason
from
    registration
where
    id >= 0
offset 0;

select
    id,
    distance_id,
    creation_date,
    status,
    last_name,
    first_name,
    middle_name,
    birth_date,
    gender,
    email,
    mobile_phone,
    delete_reason
from
    registration
where
    id >= 6
offset 0;

-- найти по идентификатору

select
    id,
    distance_id,
    creation_date,
    status,
    last_name,
    first_name,
    middle_name,
    birth_date,
    gender,
    email,
    mobile_phone,
    delete_reason
from
    registration
where
    id = 1;

-- найти по параметрам

-- найти по дистанции

select
    id,
    distance_id,
    creation_date,
    status,
    last_name,
    first_name,
    middle_name,
    birth_date,
    gender,
    email,
    mobile_phone,
    delete_reason
from
    registration
where
    distance_id = 1;

-- найти по дистанции и полу

select
    id,
    distance_id,
    creation_date,
    status,
    last_name,
    first_name,
    middle_name,
    birth_date,
    gender,
    email,
    mobile_phone,
    delete_reason
from
    registration
where
    distance_id = 1
    and gender = 'MALE';

-- найти по дистанции и статусу

select
    id,
    distance_id,
    creation_date,
    status,
    last_name,
    first_name,
    middle_name,
    birth_date,
    gender,
    email,
    mobile_phone,
    delete_reason
from
    registration
where
    distance_id = 6
    and status = 'ACCEPTED';

-- найти по дистанции и причине удаления

select
    id,
    distance_id,
    creation_date,
    status,
    last_name,
    first_name,
    middle_name,
    birth_date,
    gender,
    email,
    mobile_phone,
    delete_reason
from
    registration
where
    distance_id = 6
    and delete_reason = 'REFUSED';

-- updates (Update)

-- обновляем все поля одной записи по идентификатору

update registration
set
    distance_id = 1,
    creation_date = '2025-02-01 15:16:01.000000',
    status = 'PENDING_PAYMENT',
    last_name = 'Петров',
    first_name = 'Василий',
    middle_name = 'Александрович',
    birth_date = '1985-04-17 00:00:00.000000',
    gender = 'MALE',
    email = 'petrov_va@mail.ru',
    mobile_phone = '9999999999',
    delete_reason = null
where
    id = 1;

-- deletes (Delete)

-- удаляем запись по идентификатору

delete from registration where id = 1;