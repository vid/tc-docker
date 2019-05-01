#!/bin/sh

. /opt/TalentCloud/env
if [ ! -f $WEBROOT/.setup ]; then
  /opt/TalentCloud/op-assert.sh
fi
sleep 365d; 
