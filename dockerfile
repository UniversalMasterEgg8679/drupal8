FROM drupal:8.0.0-rc3
MAINTAINER Kaliop

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    ln -s /usr/local/bin/composer /usr/bin/composer

RUN echo "deb http://httpredir.debian.org/debian jessie main contrib" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install git -y

RUN apt-get update && \
    apt-get install -y \
    bzip2 \
    corkscrew \
    curl \
    git \
    htop \
    imagemagick \
    locales \
    mysql-client \
    nano \
    net-tools \
    p7zip-full \
    poppler-utils \
    pwgen \
    sudo \
    unzip \
    vim \
    openjdk-7-jre-headless \
    libapparmor1 \
    zsh;

RUN git clone --depth 1 https://github.com/drush-ops/drush.git /usr/local/src/drush && \
    ln -s /usr/local/src/drush/drush /usr/bin/drush && \
    cd /usr/local/src/drush && composer install
