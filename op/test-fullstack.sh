#!/bin/sh
. /opt/TalentCloud/env
cd $BASE
CI_BRANCH=${1}

if [ -z $CI_BRANCH ] ; then
  echo "Missing argument for CI_BRANCH";
  exit 1
fi

echo "running talentcloud-op tests branch=${CI_BRANCH}"
git init . && \
git pull https://github.com/GCTC-NTGC/TalentCloud.git $CI_BRANCH && \

/opt/TalentCloud/op-assert.sh && \

echo "tests finished"