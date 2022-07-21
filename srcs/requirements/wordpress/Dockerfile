FROM alpine:3.15

RUN 	apk update
RUN		apk upgrade
# https://ertano.com/required-php-modules-for-wordpress/
RUN		apk add --no-cache  wget  mariadb-client \
			php7				\
			php7-fpm			\
			php7-bcmath			\
			php7-bz2 			\
			php7-calendar		\
			php7-ctype			\
			php7-curl			\
			php7-phar 			\
			php7-json 			\
			php7-mysqli 		\
			php7-iconv

RUN 	adduser -S nginx && addgroup -S nginx

# install wp-cli
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		cp wp-cli.phar /usr/bin/wp

# https://myjeeva.com/php-fpm-configuration-101.html
COPY 	conf/php-fpm.conf 	/etc/php7/php-fpm.conf
# https://gaspar.totaki.com/en/option-configure-php-fpm-fastcgi/
COPY 	conf/www.conf 		/etc/php7/php-fpm.d/www.conf
COPY 	entrypoint.sh 		/tmp/entrypoint.sh

WORKDIR /var/www/html
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"] 
