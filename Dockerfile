
FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx


RUN set -x \
        && rm -f /etc/nginx/nginx.conf \
        && rm -f /etc/nginx/conf.d/default.conf
        
COPY ["nginx.conf", "/etc/nginx/nginx.conf"]  
PORT=8080
EXPOSE $PORT
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/nginx.conf && /usr/sbin/nginx -g 'daemon off;'
