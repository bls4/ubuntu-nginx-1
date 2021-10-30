FROM ubuntu:20.04

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN rm -f /etc/apt/sources.list && \
#All Official Focal Repos
	bash -c 'echo -e "deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse\ndeb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse\ndeb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse\ndeb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse\ndeb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse\ndeb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse\ndeb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse\ndeb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse\ndeb http://archive.canonical.com/ubuntu focal partner\ndeb-src http://archive.canonical.com/ubuntu focal partner" >/etc/apt/sources.list' && \
	apt-get update && \
	apt-get install -y \
	wget \
	htop \
	nano \
	git \
	curl \
	nginx 
	
COPY nginx.conf /etc/nginx/nginx.conf

CMD sed -i '/ssl_certificate/d' /etc/nginx/nginx.conf\
    && sed -i '/listen 443/d' /etc/nginx/nginx.conf\
    && sed -i -e "s/listen 80/listen $PORT/" /etc/nginx/nginx.conf\
    && sed -i -e "s/proxy_set_header Accept-Encoding/proxy_set_header x-request-id '';proxy_set_header x-forwarded-for '';proxy_set_header x-forwarded-proto '';proxy_set_header x-forwarded-port '';proxy_set_header via '';proxy_set_header connect-time '';proxy_set_header x-request-start '';proxy_set_header total-route-time '';proxy_set_header Accept-Encoding/" /etc/nginx/nginx.conf\
    && nginx -g "daemon off;"
