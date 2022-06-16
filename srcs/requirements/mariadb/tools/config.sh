#!/bin/sh
# config.sh

set -e
  
host='${MYSQL_HOST}'
shift
  
until MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD psql -h "$host" -U "mysql" -c '\q'; do
  >&2 echo "MariaDB is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "MariaDB is up - executing command"
exec "$@"

service mysql start

