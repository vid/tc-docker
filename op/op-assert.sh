#!/bin/sh 
BASE=/opt/TalentCloud/var/www

if [ -f $BASE/.setup ]; then
  echo -n talentcloud has a setup file from `cat $BASE/.setup`
else 
  echo "running talentcloud-op setup via op-assert.sh"
  if [ ! -d /var/log/nginx ]; then
    mkdir /var/log/nginx/
  fi && \
  make gen-certs env composer-install laravel-init fresh-db fake-data npm-install npm-dev && \
  # FIXME this should use nginx UUID
  chmod -R 777 $BASE/bootstrap/cache && \
  chmod -R 777 $BASE/storage && \
  date > $BASE/.setup
fi

# wait around for op commands
sleep 365d
