FROM composer:1.5.1 AS composer

FROM php:7.2-alpine3.7

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apk update && apk upgrade && \
  docker-php-source extract && \
  # transitory packages
  apk add --no-cache --virtual .build-dependencies \
  zlib-dev \
  cyrus-sasl-dev \
  autoconf \
  g++ \
  libtool \
  pcre-dev && \
  # included packages
  apk add --no-cache \
  nodejs-npm \
  git \
  make \
  libzip-dev \
  postgresql-dev imagemagick-dev && \
  pecl install imagick && \
  pecl install xdebug && \
  pecl install zip && \
  docker-php-ext-enable imagick xdebug zip && \
  docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
  docker-php-ext-install pgsql pdo_pgsql && \
  apk del .build-dependencies && \
  rm -rf /var/cache/apk/*

WORKDIR /var/www
CMD ["/opt/TalentCloud/up.sh"]

