FROM debian:buster

RUN apt-get update
RUN apt-get install nginx

WORKDIR /var/www/myserver # keep or remove?

COPY ./conf/nginx.config /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/nginx.config /etc/nginx/sites-enabled/

# COPY ./srcs/admin+wp.sh ./ 
# RUN bash ./admin+wp.sh && rm -rf ./admin+wp.sh

COPY ../wordpress/conf/wp-config.php /var/www/myserver/wordpress/

# RUN chmod 660 /var/www/myserver/phpmyadmin/config.inc.php
# RUN chmod 660 /var/www/myserver/wordpress/wp-config.php
RUN openssl req -x509 -nodes -days 365 -subj "/C=BE/ST=Belgium/L=Brussels/O=BeCentral/OU=s19/CN=mlazzare" \
      -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key \
      -out /etc/ssl/nginx-selfsigned.crt;

RUN chown -R www-data:www-data ../**/** # keep or remove these three lines
RUN chown -R 755 /var/www/myserver
RUN chmod -R 755 /var/www/*

EXPOSE 80 443
