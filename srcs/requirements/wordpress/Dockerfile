FROM    debian:buster

RUN     apt-get update -y && apt-get upgrade -y
RUN     apt-get install -y wget zip unzip \
                        php php-phar \
			php-json php-curl php-fpm php-mysqli php-iconv \
                        php-fpm mariadb-client 

RUN     mkdir -p /var/www/html
RUN     chown -R www-data:www-data /var/www/html # www-data is the user group in debian

RUN     userdel -f www-data && useradd -u 82 www-data # keep or remove?

RUN     mkdir -p /usr/bin/wp
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -p /usr/bin/wp 
RUN	chmod 700 ./usr/bin/wp 
RUN	wp core download --path=/var/www/wordpress

WORKDIR /var/www/html/wordpress

COPY    ./conf/wp-config.php    /config/
# COPY    ./conf/php-fpm.conf     /etc/php/fpm/
COPY    ./tools/entrypoint.sh   /tmp/

EXPOSE 3306 # 9000 ?

ENTRYPOINT ["/tmp/entrypoint.sh"]
