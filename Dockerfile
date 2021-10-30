
FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx nano


COPY default.conf /etc/nginx/conf.d/

CMD sed -i -e 's/listen  80/'"listen  $PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
