-- DDL (Data Definition Language)

-- before start development (from devops)

-- create role (user)

create role development_admin with
    login
    nosuperuser
    createdb
    nocreaterole
    inherit
    noreplication
    connection limit -1
    password '123';

-- create database

create database development
    with
    owner = development_admin
    encoding = 'UTF8'
    connection limit = -1;

-- db.url: jdbc:postgresql://localhost:5432/development
-- db.username: development_admin
-- db.password: 123

-- start development

-- create table race

create table if not exists race
(
    id bigserial primary key,
    is_active boolean not null,
    race_date timestamp without time zone not null,
    race_name varchar(200) not null,
    race_city varchar(100) not null,
    race_address varchar(200) not null,
    description text
);

comment on table race is 'Забег';
comment on column race.id is 'Идентификатор забега';
comment on column race.is_active is 'Признак активности забега';
comment on column race.race_date is 'Дата забега';
comment on column race.race_name is 'Название забега';
comment on column race.race_city is 'Город забега';
comment on column race.race_address is 'Адрес забега';
comment on column race.description is 'Описание забега';

-- create table distance

create table if not exists distance
(
    id bigserial primary key,
    version bigint not null default 0,
    race_id bigint not null references race (id),
    distance_name varchar(4) not null,
    entrance_fee numeric,
    entrance_currency varchar(3),
    racer_limit integer,
    constraint distance_race_id_distance_name_key unique (race_id, distance_name)
);

comment on table distance is 'Дистанция забега';
comment on column distance.id is 'Идентификатор дистанции';
comment on column distance.version is 'Версия строки для оптимистичной блокировки';
comment on column distance.race_id is 'Идентификатор забега';
comment on column distance.distance_name is 'Название дистанции';
comment on column distance.entrance_fee is 'Сумма вступительного взноса';
comment on column distance.entrance_currency is 'Валюта вступительного взноса';
comment on column distance.racer_limit is 'Лимит участников';

-- create table registration

create table if not exists registration
(
    id bigserial primary key,
    distance_id bigint not null references distance (id),
    creation_date timestamp without time zone not null,
    status varchar(20) not null,
    last_name varchar(100) not null,
    first_name varchar(100) not null,
    middle_name varchar(100) not null,
    birth_date timestamp without time zone not null,
    gender varchar(6) not null,
    email varchar(100) not null,
    mobile_phone varchar(10) not null,
    delete_reason varchar(20)
);

comment on table registration is 'Регистрация на дистанцию забега';
comment on column registration.id is 'Идентификатор регистрации';
comment on column registration.distance_id is 'Идентификатор дистанции забега';
comment on column registration.creation_date is 'Дата создания регистрации';
comment on column registration.status is 'Статус регистрации';
comment on column registration.last_name is 'Фамилия участника';
comment on column registration.first_name is 'Имя участника';
comment on column registration.middle_name is 'Отчество участника';
comment on column registration.birth_date is 'Дата рождения участника';
comment on column registration.gender is 'Пол участника';
comment on column registration.email is 'Адрес электронной почты участника';
comment on column registration.mobile_phone is 'Номер мобильного телефона участника';
comment on column registration.delete_reason is 'Причина удаления регистрации';

-- create stored procedure get_distance

create or replace procedure get_distance(
    _distance_id bigint,
    inout _id bigint default 0,
    inout _version bigint default 0
)
language plpgsql
AS $$
begin
    update distance set version = version + 1 where id = _distance_id returning id, version into _id, _version;
    commit;
end;
$$;

-- create stored procedure add_registration

create or replace procedure add_registration(
    _distance_id bigint,
    _version bigint,
    _creation_date timestamp without time zone,
    _last_name varchar(100),
    _first_name varchar(100),
    _middle_name varchar(100),
    _birth_date timestamp without time zone,
    _gender varchar(6),
    _email varchar(100),
    _mobile_phone varchar(10),
    _delete_reason boolean,
    inout _is_added boolean default false
)
language plpgsql
AS $$
declare
    _id bigint;
    _status varchar(20);
    _entrance_fee numeric;
    _racer_limit int default null;
begin
    select id, entrance_fee, racer_limit into _id, _entrance_fee, _racer_limit from distance where id = _distance_id and version = _version;

    if _id is null then
        rollback;
        raise exception 'Unable to add registration: version id is incorrect';
    end if;

    if _entrance_fee is not null then
        _status = 'PENDING_PAYMENT';
    else
        _status = 'ACCEPTED';
    end if;

    if _racer_limit is null or (_racer_limit is not null and _racer_limit > 0) then
        insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
            (_distance_id, _creation_date, _status, _last_name, _first_name, _middle_name, _birth_date, _gender, _email, _mobile_phone, _delete_reason);

        update distance set racer_limit = racer_limit - 1 where id = _distance_id and version = _version;

        _is_added = true;
    else
        raise exception 'Unable to add registration: racer limit is 0';
    end if;

    commit;
end;
$$;

-- create stored procedure delete_registration

create or replace procedure delete_registration(
    _registration_id bigint,
    _version bigint
)
language plpgsql
AS $$
declare
    _id bigint;
    _distance_id bigint;
    _racer_limit int default null;
    _status varchar(20);
begin
    select status, distance_id into _status, _distance_id from registration where id = _registration_id;

    if _status = 'PAID' then
        update registration set status = 'PENDING REFUND' where id = _registration_id;
    else
        delete from registration where id = _registration_id;
    end if;

    select id, racer_limit into _distance_id, _racer_limit from distance where id = _distance_id;

    if _racer_limit is not null then
        update distance set racer_limit = racer_limit + 1 where id = _distance_id and version = _version returning id into _id;

        if _id is null then
            rollback;
            raise exception 'Unable to add registration: version id is incorrect';
        end if;
    end if;

    commit;
end;
$$;

-- drop tables

drop table registration;
drop table distance;
drop table race;

-- drop procedures

drop procedure get_distance;
drop procedure add_registration;
drop procedure delete_registration;