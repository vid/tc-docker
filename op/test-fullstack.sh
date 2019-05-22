#!/bin/sh
. /opt/TalentCloud/op/env
cd $WEBROOT
BRANCH=${1}

$OPROOT/op-assert.sh ${BRANCH} && \
echo "running talentcloud-op tests for branch ${BRANCH}" && \
cp $OPROOT/*junit.xml $APPROOT/reports/ && \
make -f $OPROOT/Makefile test-all && \
ls $APPROOT/reports/ && \
echo "tests finished"
