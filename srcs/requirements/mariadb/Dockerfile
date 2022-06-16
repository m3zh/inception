FROM  debian:buster

RUN   apt-get update
RUN   apt-get upgrade -y
RUN   apt-get install -yq apt-utils mariadb-server

RUN 	mkdir -p /var/lib/mysqld

ARG MYSQL_DATABASE=${MYSQL_DATABASE}
ARG MYSQL_USER=${MYSQL_USER}
ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}
ARG MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

COPY tools/config.sh /tmp/config.sh
COPY conf/my.cnf  /etc/my.cnf.d

ENTRYPOINT ["/tmp/config.sh"]
 
EXPOSE 3306
