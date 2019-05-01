#!/bin/sh
. /opt/TalentCloud/env
cd $WEBROOT
CI_BRANCH=${1}

if [ -z $CI_BRANCH ] ; then
  echo "Missing argument for CI_BRANCH";
  exit 1
fi

echo "running talentcloud-op tests branch=${CI_BRANCH}"
git clone --single-branch --branch $CI_BRANCH https://github.com/GCTC-NTGC/TalentCloud.git && \
cp -r TalentCloud/. . && /
rmdir TalentCloud && /

/opt/TalentCloud/op-assert.sh && \
make test-all

echo "tests finished"