#!/bin/sh
. /opt/TalentCloud/env

echo "running talentcloud-op setup via op-assert.sh"
if [ ! -d /var/log/nginx ]; then
  mkdir /var/log/nginx/
fi && \
# FIXME commands other than gen-certs should be run as non-root user
make gen-certs env composer-install laravel-init fresh-db fake-data npm-install-cross-env-global npm-install npm-dev && \
for i in storage bootstrap/cache; do
  chgrp -R www-data $WEBROOT/$i && \
  chmod -R g+rxws $WEBROOT/$i
done && \
date > $WEBROOT/.setup
