#!/bin/bash

export MARIADB_VERSION=${1:-10.2.37}

docker compose up -d --wait
docker compose exec -T mariadb mysql -u root -p'root' magentodb < magentodb.sql
echo " # MariaDB $MARIADB_VERSION - request start: $(date)"
time docker-compose exec -T mariadb mysql -u myuser -p'mypass' < request.sql > /dev/null
echo " # MariaDB $MARIADB_VERSION - request end: $(date)"
docker compose down
