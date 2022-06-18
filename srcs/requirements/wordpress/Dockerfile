FROM    debian:buster

RUN     apt-get update -y && apt-get upgrade -y
RUN     apt-get install -y wget zip unzip \
                        php php-phar \
			php-json php-curl php-fpm php-mysqli php-iconv \
                        php-fpm mariadb-client 

RUN     mkdir -p /var/www/html
RUN     mkdir -p /var/www/html/wordpress
RUN     chown -R www-data:www-data /var/www/html /var/www/html/wordpress # www-data is the user group in debian

WORKDIR /var/www/html/wordpress

RUN     mkdir -p /usr/bin/wp
RUN	chmod 700 /usr/bin/wp /var/www/html/wordpress
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp 

COPY    ./conf/wp-config.php    /config/wp-config
COPY    ./conf/www.conf         /etc/php/7.3/fpm/pool.d/

# COPY    ./conf/php-fpm.conf     /etc/php/fpm/
COPY    ./tools/entrypoint.sh   /tmp/
RUN     chmod 777 /tmp/entrypoint.sh
RUN     echo "IncludeOptional sites-enabled/*.conf" >> /etc/apache2/apache2.conf
RUN     echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf

EXPOSE 9000

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
