
FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx
RUN rm -f /etc/nginx/sites-enabled/default
RUN rm -f /var/www/html/index.nginx-debian.html
RUN apt-get install -y iputils-ping


COPY default.conf /etc/nginx/conf.d/

CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && /usr/sbin/nginx -g 'daemon off;'
