FROM debian:jessie
MAINTAINER Andrew Hromis "http://hromis.com"

ENV DEBIAN_FRONTEND noninteractive
RUN (echo "deb http://http.debian.net/debian/ jessie main contrib non-free" > /etc/apt/sources.list && \
     echo "deb http://http.debian.net/debian/ jessie-updates main contrib non-free" >> /etc/apt/sources.list && \
     echo "deb http://security.debian.org/ jessie/updates main contrib non-free" >> /etc/apt/sources.list)

RUN apt-get update && apt-get -y install \
    apt-utils locales wget unzip zip curl ca-certificates && \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen && \
    /usr/sbin/update-locale LANG=en_US.UTF-8 && \
    apt-get clean && rm -Rf /var/cache/apt

ENV LC_ALL en_US.UTF-8
