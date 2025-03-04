-- CRUD (Create Read Update Delete) for race

-- inserts (Create)

-- добавить запись со всеми полями

insert into race (is_active, race_date, race_name, race_city, race_address, description) values
    (true, '2025-02-22 12:00:00.000000', 'Забег настоящих мужчин', 'Москва', 'Перовский сквер', null);

-- selects (Read)

-- найти все записи

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race;

-- найти с постраничной разбивкой условие where и лимит

-- определяем количество страниц

select count(*) from race;

-- передаём в запрос максимальный идентификатор с прошлой страницы или 0 для первой

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    id >= 0
limit 1;

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    id >= 1
limit 1;

-- найти по идентификатору

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    id = 1;

-- найти по параметрам

/*
  Если для поиска будет четыре отдельных поля:
    - признак активности
    - дата забега
    - название забега
    - город забега
*/

-- найти по признаку активности

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    is_active = true;

-- найти по дате забега через >= и через <=

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    race_date >= '2025-02-22 00:00:00.000000'
    and race_date <= '2025-02-22 23:59:59.999999';

-- найти по дате забега через between

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    race_date between '2025-02-22 00:00:00.000000' and '2025-02-22 23:59:59.999999';

-- найти по названию, приводя всё к нижнему регистру через lower

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    lower(race_name) like '%' || lower('эст') || '%';

-- найти по городу, приводя всё к нижнему регистру через lower

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    lower(race_city) like '%' || lower('мос') || '%';

-- найти по признаку активности и дате

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    is_active = true
    and race_date between '2025-03-01 00:00:00.000000' and '2025-03-01 23:59:59.999999';

-- найти по признаку активности и названию

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    is_active = true
    and lower(race_name) like '%' || lower('эст') || '%';

-- найти по признаку активности и городу

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    is_active = true
    and lower(race_city) like '%' || lower('мос') || '%';

-- найти по признаку активности, дате и названию

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    is_active = true
    and race_date between '2025-03-01 00:00:00.000000' and '2025-03-01 23:59:59.999999'
    and lower(race_name) like '%' || lower('эст') || '%';

-- найти по признаку активности, дате и городу

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    is_active = true
    and race_date between '2025-02-22 00:00:00.000000' and '2025-02-22 23:59:59.999999'
    and lower(race_city) like '%' || lower('мос') || '%';

-- найти по признаку активности, дате, названию и городу

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    is_active = true
    and race_date between '2025-03-01 00:00:00.000000' and '2025-03-01 23:59:59.999999'
    and lower(race_name) like '%' || lower('эст') || '%'
    and lower(race_city) like '%' || lower('мос') || '%';

-- все остальные комбинации полей для поиска

/*
  Если для поиска будет три отдельных поля:
    - признак активности
    - дата забега
    - строка поиска (название забега или город забега)
*/

-- найти по признаку активности

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    is_active = true;

-- найти по дате забега через >= и через <=

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    race_date >= '2025-02-22 00:00:00.000000'
    and race_date <= '2025-02-22 23:59:59.999999';

-- или по дате забега через between

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    race_date between '2025-02-22 00:00:00.000000' and '2025-02-22 23:59:59.999999';

-- найти по строке поиска

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    lower(race_name) like '%' || lower('а') || '%'
    or lower(race_city) like '%' || lower('а') || '%';

-- найти по признаку активности и дате

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    is_active = true
    and race_date between '2025-02-22 00:00:00.000000' and '2025-02-22 23:59:59.999999';

-- найти по признаку активности и строке поиска

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    is_active = true
    and (
        lower(race_name) like '%' || lower('а') || '%'
        or lower(race_city) like '%' || lower('а') || '%'
    );

-- найти по признаку активности, дате и строке поиска

select
    id,
    is_active,
    race_date,
    race_name,
    race_city,
    race_address,
    description
from
    race
where
    is_active = true
    and race_date between '2025-02-22 00:00:00.000000' and '2025-02-22 23:59:59.999999'
    and (
        lower(race_name) like '%' || lower('а') || '%'
        or lower(race_city) like '%' || lower('а') || '%'
    );

-- все остальные комбинации полей для поиска

-- updates (Update)

-- обновляем все поля одной записи по идентификатору

update race
set
    is_active = true,
    race_date = '2025-02-22 12:00:00.000000',
    race_name = 'Забег настоящих мужчин',
    race_city = 'Москва',
    race_address = 'Перовский сквер',
    description = null
where
    id = 1;

-- deletes (Delete)

-- удаляем все записи

delete from race;

-- удаляем запись по идентификатору

delete from race where id = 1;