FROM debian:jessie

MAINTAINER Tom Hirashima <tom@straightnochaser.org>

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.8.0-1~jessie

RUN apt-get update && \
    apt-get install -y ca-certificates nginx=${NGINX_VERSION} supervisor && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/app

# Setup supervisord
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /opt/app/supervisord.conf

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

# Start processes
CMD ["/usr/bin/supervisord", "-c", "/opt/app/supervisord.conf"]
