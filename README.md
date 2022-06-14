# Inception
A 42 project about containers and docker-compose

### How to write the Makefile  
You can either do:
> `$(NAME): cd ./srcs && sudo docker-compose up`
OR
`$(NAME): sudo docker-compose srcs/docker-compose.yml -up`

All the commands to create `clean, fclean, re` are [here](https://docs.docker.com/engine/reference/commandline/docker/)
Particularly useful are `rm, prune, up, down`

### How to write the docker-compose.yml  
### How to write the Dockerfile  

## Debugging  
Do not build from the docker-compose file.  
Go to each single container folder (eg srsc/requirements/mariadb) and run `docker build .`  

## Errors and solution
1. `Error starting userland proxy: listen tcp4 0.0.0.0:3306: bind: address already in use`  
Use `netstat -tulpn` on the terminal to get the PID  
Then `kill -9 PID`  
If there is no PID > [SO solution](https://serverfault.com/questions/311009/netstat-shows-a-listening-port-with-no-pid-but-lsof-does-not)  
if after killing PID, another PID is always listening on the same port, `sudo service mysql stop`  

2. `Couldn't connect to Docker daemon at http+docker://localunixsocket - is it running?`  
Try `sudo docker composer`  
Else, try ```sudo usermod -a -G docker $USER
	sudo systemctl enable docker
	sudo systemctl start docker```

3. `docker.errors.DockerException: Credentials store error: StoreError('Credentials store docker-credential-secretservice exited with "Error calling StartServiceByName for org.freedesktop.secrets: Timeout was reached".',)`  
Remove credStore line in ~/.docker/config.json
