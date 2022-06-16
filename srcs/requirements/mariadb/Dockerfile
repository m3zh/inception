FROM    debian:buster

RUN     apt-get update
RUN     apt-get upgrade -y
RUN     apt-get install -yq apt-utils mariadb-server

RUN 	mkdir -p /var/lib/mysqld

COPY    tools/config.sh    /tmp/
RUN     chmod +x           /tmp/config.sh
COPY    conf/my.cnf        /etc/my.cnf.d

ENTRYPOINT ["sh", "/tmp/config.sh"]
 
EXPOSE 3306
