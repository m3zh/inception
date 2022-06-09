# Inception
A 42 project about containers

## Errors and solution


  Error starting userland proxy: listen tcp4 0.0.0.0:3306: bind: address already in use
`netstat -tulpn`
if no PID
https://serverfault.com/questions/311009/netstat-shows-a-listening-port-with-no-pid-but-lsof-does-not
if pid always listening
sudo service mysql stop

`Couldn't connect to Docker daemon at http+docker://localunixsocket - is it running?`
- sudo docker composer
OR
- sudo usermod -a -G docker $USER
	@ sudo systemctl enable docker
	@ sudo systemctl start docker

`docker.errors.DockerException: Credentials store error: StoreError('Credentials store docker-credential-secretservice exited with "Error calling StartServiceByName for org.freedesktop.secrets: Timeout was reached".',)
`

`docker.errors.DockerException: Credentials store error: StoreError('Credentials store docker-credential-secretservice exited with "Error calling StartServiceByName for org.freedesktop.secrets: Timeout was reached".',)`
sudo usermod -a -G docker $USER



for makefile
cd ./srcs &&
https://docs.docker.com/engine/reference/commandline/