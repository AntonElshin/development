begin;
    update distance set version = version + 1 where id = 5 returning entrance_fee, racer_limit, version; -- null,1,5
    commit;
end;

begin;
    -- call add_registration(5, '2025-02-09 16:34:05.000000', 'Архипова', 'Ольга', 'Михайловна', '2005-07-01 00:00:00.000000', 'FEMALE', 'arkhipova_om@mail.ru', '9999999992', null);

    -- select * from registration order by id;

    insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
        (5, '2025-02-09 16:34:05.000000', 'ACCEPTED', 'Архипова', 'Ольга', 'Михайловна', '2005-07-01 00:00:00.000000', 'FEMALE', 'arkhipova_om@mail.ru', '9999999992', null);

    -- select * from registration order by id;

    -- select * from distance order by id;

    update distance set racer_limit = racer_limit - 1 where id = 5 and version = 5;
    -- completed in 3 ms

    -- select * from distance order by id;

    rollback;
end;