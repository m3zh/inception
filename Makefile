# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlazzare <mlazzare@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/06 14:29:53 by mlazzare          #+#    #+#              #
#    Updated: 2022/06/14 00:32:14 by mlazzare         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

all: $(NAME)

$(NAME):
	sudo usermod -a -G docker ${USER}
	sudo systemctl enable docker
	sudo systemctl start docker
	sudo docker-compose -f srcs/docker-compose.yml up -d
	echo "127.0.0.1 mlazzare.42.fr" >> /etc/hosts

clean:
	sudo docker-compose -f srcs/docker-compose.yml down
	sudo docker system prune -f
	sudo docker network prune -f
	sudo docker image prune -f
	sudo docker volume prune -f

fclean: clean
	sudo docker rm -f -v --env ${docker ps -q}
	sudo docker rmi -f

stop:
	sudo docker stop ${docker ps -q}
	
restart:
	sudo docker system prune -f
	sudo docker-compose -f srcs/docker-compose.yml start

re: clean all

.PHONY: clean fclean restart all