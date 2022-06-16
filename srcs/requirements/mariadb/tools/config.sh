#!/bin/sh
# config.sh

if [ $? -ne 0 ]; then
	# Start mysql in safe mode, with "&" to be able to apply modifications
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	# We wait for the database to be accessible
	while ! mysqladmin ping -h "$MARIADB_HOST" --silent; do
    	sleep 1
	done

	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
	touch .setup
fi
# Start mysql in safe mode normally
usr/bin/mysqld_safe --datadir=/var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
	
	chown -R mysql:mysql /var/lib/mysql

	# initialize database: https://mariadb.com/kb/en/mysql_install_db/
	# initializes the MariaDB data directory and creates the system tables in the mysql database, 
	# if they do not exis
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

  USE mysql;
  FLUSH PRIVILEGES ;
  GRANT ALL ON *.* TO 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
  GRANT ALL ON *.* TO 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION ;
  SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${MYSQL_ROOT_PASSWORD}') ;
  DROP DATABASE IF EXISTS test ;
  FLUSH PRIVILEGES ;

  CREATE DATABASE $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;
  CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_USER_PASSWORD';
  CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED by '$MYSQL_USER_PASSWORD';
  GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
  GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';

  FLUSH PRIVILEGES;
	# run temp_file: start mysql server, configure it by using temp_file
	/usr/bin/mysqld --user=mysql --bootstrap < $temp_file

fi

exec /usr/bin/mysqld --user=mysql --console
