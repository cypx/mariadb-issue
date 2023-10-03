#!/bin/bash

docker compose up -d --wait
docker compose exec -it mariadb mysql -p'root' -e "CREATE DATABASE IF NOT EXISTS erpdb;"
docker compose exec -it mariadb mysql -p'root' -e "GRANT ALL PRIVILEGES ON erpdb.* TO 'myuser'@'%' WITH GRANT OPTION;"
docker compose exec -T mariadb mysql -u myuser -p'mypass' magentodb < magentodb.sql
docker compose exec -T mariadb mysql -u myuser -p'mypass' erpdb < erpdb.sql
time docker-compose exec -T mariadb mysql -u myuser -p'mypass' < request.sql
docker compose down
