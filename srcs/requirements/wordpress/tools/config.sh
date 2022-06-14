# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlazzare <mlazzare@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/06 14:33:08 by mlazzare          #+#    #+#              #
#    Updated: 2022/06/06 14:33:10 by mlazzare         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

rm -rf /etc/nginx/sites-available/default
rm -rf /etc/nginx/sites-enabled/default
sudo mkdir -p /var/www # keep or remove
sudo chown www-data: /var/www
mkdir /var/www/wordpress
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
sudo mysql -u root

rm -rf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
wget https://wordpress.org/latest.tar.gz 
tar -xvf latest.tar.gz --strip-components=1 -C /var/www/myserver/wordpress && rm -rf latest.tar.gz

sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/<your-password>/' /srv/www/wordpress/wp-config.php
