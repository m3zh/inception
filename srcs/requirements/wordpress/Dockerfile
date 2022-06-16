FROM debian:buster

RUN sudo apt-get update && sudo apt-get upgrade \
    sudo apt-get install curl \
                    mysql-server \
                    php \
                    php-mysql \
                    mariadb-client

RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/

COPY ./conf/wp-config.php ./wordpress/

RUN chown -R www-data:www-data .
RUN chmod -R 755 .

RUN echo "127.0.0.1 mlazzare.42.fr" >> /etc/apache2/apache2.conf

EXPOSE 3306

ENTRYPOINT ["sh", "entrypoint.sh"]