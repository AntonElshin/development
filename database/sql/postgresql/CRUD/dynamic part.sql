/*

  Динамическая часть запросов:

  ------------------------------------------------------------

  Общий вид запроса insert

    insert into table
      (field1, field2, field3, field4, ...) (1)   => dynamic
    values
      (value1, value2, value3, value4, ...) (2)   => dynamic

    (1) В insert всегда перечисляем все поля
    (2) В values всегда перечисляем все значения

  ------------------------------------------------------------

  Общая вид запроса select

    select
        field1,                                   => dynamic
        field2,                                   => dynamic
        field3,                                   => dynamic
        field4,                                   => dynamic
        ... (1)
    from
        table
    where                                         => dynamic
        condition1                                => dynamic
        and condition2                            => dynamic
        ... (2)

  (1) В select перечисляем все поля из таблицы, чтобы не взять лишнего
  (2) Если нет условия, тогда нет where
      Если есть одно условие, то есть where
      Если несколько условий, то есть where, первое условие, остальные условия через and или or

  ------------------------------------------------------------

  Общий вид запроса update

    update table
    set
        field1 = value1,                          => dynamic
        field2 = value2,                          => dynamic
        field3 = value3,                          => dynamic
        field4 = value4                           => dynamic
        ... (1)
    where                                         => dynamic
        condition1                                => dynamic
        and condition2                            => dynamic
        ... (2)

  (1) Увеличивается количество полей и значений в set, но мы всегда указываем все поля кроме id
  (2) Если нет условия, тогда нет where
      Если есть одно условие, то есть where
      Если несколько условий, то есть where, первое условие, остальные условия через and или or

  ------------------------------------------------------------

  Общий вид запроса delete

    delete from table
    where                                         => dynamic
        condition1                                => dynamic
        and condition2                            => dynamic
        ... (1)

  (1) Если нет условия, тогда нет where
      Если есть одно условие, то есть where
      Если несколько условий, то есть where, первое условие, остальные условия через and или or

*/