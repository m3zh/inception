# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mlazzare <mlazzare@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/06 14:29:53 by mlazzare          #+#    #+#              #
#    Updated: 2022/06/07 18:46:39 by mlazzare         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception

all: $(NAME)

$(NAME):
	@ sudo usermod -a -G docker $USER
	@ sudo systemctl enable docker
	@ sudo systemctl start docker
	@ docker-compose up
	@ echo "127.0.0.1 mlazzare.42.fr" >> /etc/hosts
	
clean:
	@ docker-compose -f srcs/docker-compose.yml down
	@ rm -rf ./$(NAME)

fclean: clean
	@ docker system prune -f

restart:
	@ docker system prune -f
	@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY: clean fclean restart all