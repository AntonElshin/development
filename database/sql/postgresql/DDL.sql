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
    id bigint,
    is_active boolean,
    race_date timestamp without time zone,
    race_name varchar(100),
    race_city varchar(100),
    race_address varchar(200),
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
    id bigint,
    distance_name varchar(4),
    entrance_fee numeric,
    entrance_currency varchar(3),
    racer_limit_left integer
);

comment on table distance is 'Дистанция забега';
comment on column distance.id is 'Идентификатор дистанции';
comment on column distance.distance_name is 'Название дистанции';
comment on column distance.entrance_fee is 'Сумма вступительного взноса';
comment on column distance.entrance_currency is 'Валюта вступительного взноса';
comment on column distance.racer_limit_left is 'Оставшийся лимит участников';

-- create table registration

create table if not exists registration
(
    id bigint,
    creation_date timestamp without time zone,
    status varchar(20),
    last_name varchar(100),
    first_name varchar(100),
    middle_name varchar(100),
    birth_date timestamp without time zone,
    gender varchar(6),
    email varchar(100),
    mobile_phone varchar(10),
    delete_reason varchar(20)
);

comment on table registration is 'Регистрация на дистанцию забега';
comment on column registration.id is 'Идентификатор регистрации';
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

-- drop tables

drop table race;
drop table distance;
drop table registration;