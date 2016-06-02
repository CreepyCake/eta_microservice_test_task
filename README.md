Тестовое задание для wheely: микросервис для расчёта ETA на основе позиций машин и позиции клиента.

Написан на Ruby 2.3.0 с иcпользованием гемов grape (для API), grape-swagger (для документации), grape-activerecord (для работы с базой данных);
база данных - PostgreSQL 9.5. В базу добавляется 50 машин с рандомными значениями долготы, широты и доступности. Расчёт ETA реализован как метод
модели Car. Позиция клиента передаётся параметрами запроса get. ETA рассчитывается как haversine(car_position, client_position) * 1.5,
берётся среднее для трёх ближайших доступных машин.

Запуск:

1. Иметь установленные Ruby и PostgreSQL.
2. bundle update
3. bundle exec rake db:setup
4. bundle exec rackup -p PORT
5. localhost:PORT/closest?lan&lon (lan - широта позиции клиента, lon - долгота)


Документация в формате json: localhost:PORT/swagger_doc.json (пытался настроить Swagger UI, но почему-то работает только через live demo на petstore.swagger.io).
