FROM ubuntu:trusty
MAINTAINER Tom Hirashima <tom@straightnochaser.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y python python-pip python-dev libmysqlclient-dev git supervisor && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/app

# assumes you have set up an local .env file with production values
COPY .env /opt/app/.env
COPY gunicorn_config.py /opt/app/gunicorn_config.py
COPY bootstrap.sh /opt/app/bootstrap.sh
RUN chmod +x /opt/app/bootstrap.sh

# Setup supervisord
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /opt/app/supervisord.conf

COPY requirements.txt /opt/app/requirements.txt
RUN pip install -r /opt/app/requirements.txt

# assumes sourcecode is checked out into a dir named 'source' in the same dir as the Dockerfile
ADD source /opt/app/
VOLUME /opt/app/static
WORKDIR /opt/app

EXPOSE 8000

# Start processes
CMD ["/opt/app/bootstrap.sh"]
