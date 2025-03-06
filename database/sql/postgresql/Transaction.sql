begin;
    --call add_registration(5, '2025-02-09 16:34:05.000000', 'Архипова', 'Ольга', 'Михайловна', '2005-07-01 00:00:00.000000', 'FEMALE', 'arkhipova_om@mail.ru', '9999999992', null);

    insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
        (5, '2025-02-09 16:34:05.000000', 'ACCEPTED', 'Архипова', 'Ольга', 'Михайловна', '2005-07-01 00:00:00.000000', 'FEMALE', 'arkhipova_om@mail.ru', '9999999992', null);

    update distance set racer_limit = racer_limit - 1 where id = 5;

    rollback;
end;

begin;
    --call add_registration(5, '2025-02-09 16:34:05.000000', 'Архипова', 'Ольга', 'Михайловна', '2005-07-01 00:00:00.000000', 'FEMALE', 'arkhipova_om@mail.ru', '9999999992', null);

    insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
        (5, '2025-02-09 16:34:05.000000', 'ACCEPTED', 'Архипова', 'Ольга', 'Михайловна', '2005-07-01 00:00:00.000000', 'FEMALE', 'arkhipova_om@mail.ru', '9999999992', null);

    update distance set racer_limit = racer_limit - 1 where id = 5;

    commit;
end;