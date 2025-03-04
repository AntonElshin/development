-- DML (Data Manipulation Language)

-- selects

select * from race;
select * from distance;
select * from registration;

-- inserts into race

insert into race (id, is_active, race_date, race_name, race_city, race_address, description) values
    (null, null, null, null, null, null, null);

-- inserts into distance

insert into distance (id, distance_name, entrance_fee, entrance_currency, racer_limit) values
    (null, null, null, null, null);

-- inserts into registration

insert into registration (id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
    (null, null, null, null, null, null, null, null, null, null, null);

-- deletes

delete from race;
delete from distance;
delete from registration;