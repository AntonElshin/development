begin;
    update distance set version = version + 1 where id = 5 returning entrance_fee, racer_limit, version; -- null,1,6
    commit;
end;

begin;
    -- call add_registration(5, '2025-02-10 07:08:22.000000', 'Комарова', 'Юлия', 'Игоревна', '2001-09-16 00:00:00.000000', 'FEMALE', 'komarova_yi@mail.ru', '9999999991', null);

    -- select * from registration order by id;

    insert into registration (distance_id, creation_date, status, last_name, first_name, middle_name, birth_date, gender, email, mobile_phone, delete_reason) values
        (5, '2025-02-10 07:08:22.000000', 'ACCEPTED', 'Комарова', 'Юлия', 'Игоревна', '2001-09-16 00:00:00.000000', 'FEMALE', 'komarova_yi@mail.ru', '9999999991', null);

    -- select * from registration order by id;

    -- select * from distance order by id;

    update distance set racer_limit = racer_limit - 1 where id = 5 and version = 6;
    -- 1 row affected in 3 ms

    -- select * from distance order by id;

    commit;
end;