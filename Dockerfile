
FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx
RUN rm -f /etc/nginx/sites-enabled/default
RUN rm -f /var/www/html/index.nginx-debian.html

COPY default /etc/nginx/sites-enabled
#COPY 22.txt /var/www/html/22.txt
COPY 33.txt /var/www/html/33.txt

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
#ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
#CMD /usr/sbin/nginx -g daemon off
#ENTRYPOINT /usr/sbin/nginx -g deamon off

