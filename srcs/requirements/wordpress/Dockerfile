FROM    debian:buster

RUN     sudo apt-get update && sudo apt-get upgrade \
        sudo apt-get install wget \
                    php7 php-phar \
			        php-json php-curl php-fpm php-mysqli php-iconv

RUN     mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -p /usr/bin/wp 
RUN		chmod 700 ./usr/bin/wp 
RUN		wp core download --path=/var/www/wordpress

COPY    ./conf/wp-config.php /config/

COPY    ./tools/entrypoint.sh .
# RUN chown -R www-data:www-data .
# RUN chmod -R 755 .

EXPOSE 3306

ENTRYPOINT ["entrypoint.sh"]
