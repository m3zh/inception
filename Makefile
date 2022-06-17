# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlazzare <mlazzare@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/06 14:29:53 by mlazzare          #+#    #+#              #
#    Updated: 2022/06/17 07:04:20 by mlazzare         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: 
	sudo usermod -a -G docker ${USER}
	sudo systemctl enable docker
	sudo systemctl start docker
	sudo docker-compose -f srcs/docker-compose.yml up
	sudo mkdir -f /home/root
	sudo mkdir -f /home/${USER}
	@sudo chmod 700 /etc/hosts
	@echo "127.0.0.1 mlazzare.42.fr" >> /etc/hosts

clean:
	sudo docker system prune -f
	sudo docker network prune -f
	sudo docker image prune -a -f
	sudo docker volume prune -f

fclean: clean
	sudo docker-compose -f srcs/docker-compose.yml down
	@if	[ "${docker ps -q}" ]; then \
		sudo docker rm -f -v ${docker ps -q}; \
	fi
	@if	[ "${docker images -a -q}" ]; then \
		docker images -a -q | xargs docker rmi -f; \
	fi
	sudo systemctl stop nginx

stop:
	@if	[ "${docker ps -q}" ]; then \
		docker-compose -f srcs/docker-compose.yml stop; \
	else \
		echo "\e[32mWARNING\e[0m: No container to stop"; \
	fi
	
	
restart:
	@if	[ "${docker ps -q}" ]; then \
		sudo docker-compose -f srcs/docker-compose.yml start; \
	else \
		echo "\e[32mWARNING\e[0m: No container to restart"; \
	fi
	

re: clean all

.PHONY: clean fclean restart stop all
