FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install mariadb mariadb-server mariadb-client
RUN php-fpm php-mysql \
   php php-cgi php-mysqli php-pear php-mbstring php-gettext php-common php-phpseclib php-mysql # remove or keep
   
COPY tools/configure.sh /tmp/configure.sh

ENTRYPOINT ["sh", "/tmp/configure.sh"]
 
EXPOSE 3306
