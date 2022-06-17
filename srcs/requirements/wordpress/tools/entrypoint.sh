# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlazzare <mlazzare@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/06 14:33:08 by mlazzare          #+#    #+#              #
#    Updated: 2022/06/17 06:54:59 by mlazzare         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

sudo wp core install --url="$WP_URL" \
                --admin_user="$WP_ADMIN_USER" \
    	        --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email


wp plugin update --all
wp user create $WP_USER $WP_USER_EMAIL \
                --user_pass=$WP_USER_PWD

php-fpm7 --nodaemonize
