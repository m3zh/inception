# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlazzare <mlazzare@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/06 14:29:53 by mlazzare          #+#    #+#              #
#    Updated: 2022/06/18 09:48:45 by mlazzare         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	sudo mkdir -p /home/mlazzare/data/
	sudo mkdir -p /home/mlazzare/data/wordpress
	sudo mkdir -p /home/mlazzare/data/database
	sudo chmod 777 /etc/hosts
	sudo echo "127.0.0.1 mlazzare.42.fr" >> /etc/hosts
	cd srcs/ && sudo docker-compose up -d --build

clean:
	sudo docker system prune -f
	sudo docker network prune -f
	sudo docker image prune -a -f
	sudo docker volume prune -f

fclean: clean
	@cd srcs/ && sudo docker-compose -f docker-compose.yml down --volumes --rmi all
	@if	[ "${docker ps | wc -l}" ]; then \
	 	docker ps -q | xargs sudo docker rm -f; \
	fi
	@sudo rm -rf /home/mlazzare/data

re:	fclean all

.PHONY : all clean fclean re stop restart
