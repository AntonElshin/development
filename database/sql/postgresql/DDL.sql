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