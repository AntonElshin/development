-- CRUD (Create Read Update Delete) for distance

-- inserts (Create)

-- добавить запись со всеми полями

insert into distance (race_id, distance_name, entrance_fee, entrance_currency, racer_limit) values
    (1, 'FULL', 1400.00, 'RUB', null);

-- selects (Read)

-- найти все записи

select
  id,
  race_id,
  distance_name,
  entrance_fee,
  racer_limit
from
  distance;

-- найти по идентификатору

select
  id,
  race_id,
  distance_name,
  entrance_fee,
  racer_limit
from
  distance
where
  id = 1;

-- найти по параметрам

-- найти по забегу

select
  id,
  race_id,
  distance_name,
  entrance_fee,
  entrance_currency,
  racer_limit
from
  distance
where
  race_id = 1;

-- найти по названию дистанции

select
  id,
  race_id,
  distance_name,
  entrance_fee,
  entrance_currency,
  racer_limit
from
  distance
where
  distance_name = 'FULL';

-- найти бесплатные дистанции

select
    id,
    race_id,
    distance_name,
    entrance_fee,
    entrance_currency,
    racer_limit
from
    distance
where
    entrance_fee is null;

-- найти платные дистанции

select
    id,
    race_id,
    distance_name,
    entrance_fee,
    entrance_currency,
    racer_limit
from
    distance
where
    entrance_fee is not null;

-- найти дистанции без лимита участников

select
    id,
    race_id,
    distance_name,
    entrance_fee,
    entrance_currency,
    racer_limit
from
    distance
where
    distance.racer_limit is null;

-- найти дистанции с лимитом участников

select
    id,
    race_id,
    distance_name,
    entrance_fee,
    entrance_currency,
    racer_limit
from
    distance
where
    distance.racer_limit is not null;

-- найти забеги по забегу и дистанции

select
    id,
    race_id,
    distance_name,
    entrance_fee,
    entrance_currency,
    racer_limit
from
    distance
where
    race_id = 1
    and distance_name = 'FULL';

-- найти платные дистанции по сумме в пределах

select
    id,
    race_id,
    distance_name,
    entrance_fee,
    entrance_currency,
    racer_limit
from
  distance
where
    entrance_fee is not null
    and entrance_fee between 600 and 1500;

-- все остальные комбинации полей для поиска

-- updates (Update)

-- обновляем все поля одной записи по идентификатору

update distance
set
    race_id = 1,
    distance_name = 'FULL',
    entrance_fee = 1400,
    entrance_currency = 'RUB',
    racer_limit = null
where
    id = 1;

-- deletes (Delete)

-- удаляем запись по идентификатору

delete from distance where id = 1;