
FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx nano


RUN set -x \
        && rm -rf /etc/nginx/nginx.conf \
        && rm -rf /etc/nginx/conf.d/default.conf
        
COPY ["nginx.conf", "/etc/nginx/nginx.conf"]

CMD sed -i -e 's/listen  80/'"listen  $PORT"'/g' /etc/nginx/nginx.conf && nginx -g 'daemon off;'
