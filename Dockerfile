# Dockerfile for LAMP Stack installation
# Ubuntu 18.04 image
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get upgrade -y

# Install apache
RUN apt-get install -y apache2 

# Prerequisites for installing php7.3
RUN apt-get install -y software-properties-common

RUN add-apt-repository ppa:ondrej/php

RUN apt install -y php7.3-fpm

# Install php7.3 for this set up
RUN apt install -y php7.3

# Extensions of php
RUN apt install php7.3-common php7.3-mysql php7.3-xml php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-imagick php7.3-cli php7.3-dev php7.3-imap php7.3-mbstring php7.3-opcache php7.3-soap php7.3-zip php7.3-intl -y

# Removing the default index.html page and copying the project code
RUN rm -f /var/www/html/index.html

COPY . /var/www/html/   

# Install ufw
RUN apt install ufw -y
RUN ufw app list

# install library
RUN apt-get install libapache2-mod-php7.3


# install additional packages
RUN a2dismod mpm_event &&  a2enmod mpm_prefork &&  a2enmod php7.3

# Restart apache
RUN service apache2 restart

# Provide executable permissions to the code
RUN chmod -R 0777 /var/www/html/*
RUN chmod -R 0777 /var/*

# Change WORKDIR
WORKDIR /var/www/html

CMD ["apachectl","-D","FOREGROUND"]

RUN a2enmod rewrite

EXPOSE 80
EXPOSE 443