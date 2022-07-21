while ! mariadb -h$MARIADB_HOST -u$MARIADB_USER -p$MARIADB_PWD $MARIADB_DB &>/dev/null; do
	sleep 3
done

if [ ! -f "/var/www/html/wordpress/index.php" ]; then
    wp core download --allow-root
fi 

wp config create --dbname=$WP_DATABASE --dbuser=$WP_DB_USER --dbpass=$WP_DB_PWD --dbhost=$MARIADB_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
wp core install --url=$WP_HOST --title="$WP_TITLE" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PWD --allow-root
wp theme install astra --activate --allow-root

/usr/sbin/php-fpm7 -F -R
