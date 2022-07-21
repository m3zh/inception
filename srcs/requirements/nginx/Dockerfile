FROM  debian:buster

RUN   apt-get update -y
RUN   apt-get install -y nginx openssl

COPY  ./conf/nginx.conf /etc/nginx/sites-available/default

RUN   openssl req -x509 -nodes -days 365 -subj "/C=BE/ST=Belgium/L=Brussels/O=BeCentral/OU=s19/CN=mlazzare" \
      -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key \
      -out /etc/ssl/nginx-selfsigned.crt;

EXPOSE      443

ENTRYPOINT ["nginx", "-g", "daemon off;"]