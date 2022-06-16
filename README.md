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
> A Docker image is built up from a series of layers. Each layer represents an instruction in the image’s Dockerfile. Each layer except the very last one is read-only. (docs [here](
https://docs.docker.com/storage/storagedriver/#images-and-layers))

```
FROM debian:buster

// RUN is executed at build-time, before the container starts
RUN // installations, such as RUN apt-get install php, bash commands, etc.

// CMD is executed at run-time when the container starts
CMD // CMD service start mysql

COPY // to copy one file from the local env into the docker env
     // eg. COPY /config/my-config .

EXPOSE // to expose a port

ENTRYPOINT ["..."]	// either a docker command or a bash script
			// if it's a bash script, do ["my_script.sh"]
			// if it's a docker command, do ["cmd", "flags"], eg ["nginx","-g","deamon -off"]
```


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

The command '/bin/sh -c apt-get update && apt-get upgrade' returned a non-zero code: 1
-y