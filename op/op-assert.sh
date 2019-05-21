#!/bin/sh -x
. /opt/TalentCloud/op/env

BRANCH=${1}

if [ -z $BRANCH ] ; then
  echo "Missing argument for BRANCH";
  exit 1
fi

echo "running talentcloud-op setup via op-assert.sh for $BRANCH"
# we are operating in the www directory, start fresh.
find $WEBROOT -mindepth 1 -delete
git clone --single-branch --branch $BRANCH https://github.com/GCTC-NTGC/TalentCloud.git /tmp/TalentCloud && \
mv /tmp/TalentCloud/. $WEBROOT && /
rm -rf /tmp/TalentCloud && /

cd $WEBROOT && /

if [ ! -d /var/log/nginx ]; then
  mkdir /var/log/nginx/
fi && \

chown -R www-data:www-data $WEBROOT && \
chmod -R og-w $WEBROOT && \
chmod -R u+s $WEBROOT && \
su -s /opt/TalentCloud/op/make-app.sh www-data
for i in storage bootstrap/cache; do
  chmod -R g+rxws $WEBROOT/$i
done && \
date > $WEBROOT/.setup
