#!/bin/bash

export MARIADB_VERSION=10.4.18
docker compose up
docker compose exec -T mariadb mysql -u root -p'root' magentodb < magentodb.sql
echo " # MariaDB Version check:"
docker compose exec mariadb mysql -u root -p'root' magentodb -e 'SELECT VERSION()'
echo " # MariaDB $MARIADB_VERSION - request start: $(date)"
time docker-compose exec -T mariadb mysql -u myuser -p'mypass' < request.sql > /dev/null
echo " # MariaDB $MARIADB_VERSION - request end: $(date)"
docker compose down
