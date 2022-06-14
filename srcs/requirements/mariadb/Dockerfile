FROM  debian:buster

RUN   apt-get update
RUN   apt-get upgrade -y
RUN   apt-get install -y mariadb-server

ARG MYSQL_DATABASE=${MYSQL_DATABASE}
ARG MYSQL_USER=${MYSQL_USER}
ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}
ARG MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

# 0. Launch MySQL
# 1. Create a new database
# 2. Create a new user
# 3. Grant the admin All privileges on the database
# 		(replace '%' by '${WP_HOST}.${NET_NAME}' to allow only from wordpress container)
# 4. Reload privileges tables
RUN service mysql start \
	   && mysql -u root --skip-password -e "CREATE DATABASE ${MYSQL_DATABASE};" \
	&& mysql -u root --skip-password -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" \
	&& mysql -u root --skip-password -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';" \
	&& mysql -u root --skip-password -e "FLUSH PRIVILEGES;"

COPY tools/config.sh /tmp/config.sh
COPY conf/my.cnf  /etc/my.cnf.d

ENTRYPOINT ["sh", "/tmp/config.sh"]
 
EXPOSE 3306
