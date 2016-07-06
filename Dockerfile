FROM ruby:2.1
MAINTAINER Peter Mount <peter@retep.org>

ENV DEBIAN_FRONTEND noninteractive

# DB Pool size
ENV DB_POOL         5

# DB NAME
ENV DB_NAME         thingspeak

# DB User credentials
ENV DB_USER         root
ENV DB_PASSWORD     thingspeak

# DB PostgreSQL host
ENV DB_HOST         thingspeak
ENV DB_PORT         3306

# HTTP Port
ENV HTTP_PORT       80

# Any value other than no will enable IPv6
ENV IPV6            no

COPY * /opt/thingspeak/

WORKDIR /opt/thingspeak/

RUN apt-get update &&\
    apt-get install -y \
        build-essential \
        libpq-dev &&\
    cd /opt/thingspeak &&\
    bundle install &&\
    chmod +x /*.sh &&\
    rm -rf /var/lib/apt/lists/*

#EXPOSE 80

CMD '/docker-entrypoint.sh'

