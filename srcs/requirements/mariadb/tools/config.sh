
service mysql start
mysql -u root --skip-password -e "CREATE DATABASE ${MYSQL_DB};" \
mysql -u root --skip-password -e "CREATE USER '${MYSQL_ROOT_USER}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" \
mysql -u root --skip-password -e "CREATE USER '${MYSQL_USER}' IDENTIFIED BY '${MYSQL_PASSWORD}';" \
mysql -u root --skip-password -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USER}';" \
mysql -u root --skip-password -e "FLUSH PRIVILEGES;"
