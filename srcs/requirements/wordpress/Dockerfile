FROM debian:buster

RUN sudo apt update
    sudo apt install apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mysql-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip

RUN sudo mkdir -p /var/www
    sudo chown www-data: /var/www
    curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
    sudo mysql -u root

    # https://ubuntu.com/tutorials/install-and-configure-wordpress#5-configure-database

    sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php

    sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/<your-password>/' /srv/www/wordpress/wp-config.php