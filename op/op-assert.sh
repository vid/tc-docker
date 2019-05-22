#!/bin/sh -x
. /opt/TalentCloud/op/env

BRANCH=${1}

if [ -z $BRANCH ] ; then
  echo "Missing argument for BRANCH";
  exit 1
fi

echo "running talentcloud-op setup via op-assert.sh for $BRANCH"
# we are operating in the www directory, start fresh.
find $WEBROOT -mindepth 1 -delete &&\
#git clone --single-branch --branch $BRANCH https://github.com/GCTC-NTGC/TalentCloud.git /tmp/TalentCloud && \
cd $WEBROOT &&\
git init &&\
git remote add origin https://github.com/GCTC-NTGC/TalentCloud.git  &&\
git fetch &&\
git checkout -t origin/$BRANCH &&\

cd $WEBROOT && \

if [ ! -d /var/log/nginx ]; then
  mkdir /var/log/nginx/
fi && \

chown -R www-data:www-data $WEBROOT && \
chmod -R og-w $WEBROOT && \
chmod -R u+s $WEBROOT && \

find $APPROOT/ssl/ -mindepth 1 -delete &&\
OPENSSL_CONF=/usr/src/php/ext/openssl/tests/openssl.cnf openssl req -nodes -x509 -newkey rsa:4096 -keyout ${APPROOT}/ssl/server.key -out ${APPROOT}/ssl/server.pem -days 365 -subj "/C=US/ST=Ontario/L=Ottawa/O=Localhost/OU=Org/CN=talent.test" &&\

su -s /opt/TalentCloud/op/make-app.sh www-data && \
for i in storage bootstrap/cache; do
  chmod -R g+rxws $WEBROOT/$i
done && \
date > $WEBROOT/.setup
