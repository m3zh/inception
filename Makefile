# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlazzare <mlazzare@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/06 14:29:53 by mlazzare          #+#    #+#              #
#    Updated: 2022/06/09 08:12:34 by mlazzare         ###   ########.fr        #
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
	docker-compose -f srcs/docker-compose.yml down
	docker system prune -f
	docker network prune
	docker image prune
	docker volume prune

fclean: clean
	docker network rm
	docker image rm
	docker volume rm

restart:
	docker system prune -f
	docker-compose -f srcs/docker-compose.yml start

re: clean all

.PHONY: clean fclean restart all