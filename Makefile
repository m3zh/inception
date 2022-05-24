# could not find daemon --- is it running?

#sudo usermod -a -G docker $USER # add user to docker group
#sudo systemctl enable docker # Auto-start on boot
#sudo systemctl start docker # Start right now ---> it starts the deamon


NAME = inception

all: prune reload

$(NAME):
	@ echo "127.0.0.1 raccoman.42.fr" >> /etc/hosts
	
stop:
	@ docker-compose -f srcs/docker-compose.yml down

clean: stop
	@ rm -rf ~/Desktop/$(NAME)

prune: clean
	@ docker system prune -f

reload: 
	@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY: stop clean prune reload all