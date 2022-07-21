FROM    alpine:3.15

RUN     apk update
RUN     apk upgrade
RUN     apk add --no-cache mariadb mariadb-client

# https://www.educba.com/mariadb-bind-address/
COPY    conf/mariadb-server.cnf   /etc/my.cnf.d/mariadb-server.cnf

COPY    entrypoint.sh /tmp/entrypoint.sh
RUN     chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
