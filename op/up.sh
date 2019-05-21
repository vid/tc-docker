#!/bin/sh

. /opt/TalentCloud/op/env
if [ ! -f $WEBROOT/.setup ]; then
  $OPROOT/op-assert.sh ${DEFAULT_BRANCH}
fi
sleep 365d; 
