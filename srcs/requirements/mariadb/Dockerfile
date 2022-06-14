FROM  debian:buster

RUN   apt-get update
RUN   apt-get upgrade -y
RUN   apt-get install -y mariadb-server
   
COPY tools/config.sh /tmp/config.sh

ENTRYPOINT ["sh", "/tmp/config.sh"]
 
EXPOSE 3306
