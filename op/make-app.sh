#!/bin/sh -x

. /opt/TalentCloud/op/env

make -f $OPROOT/Makefile clean env composer-install laravel-init fresh-db fake-data npm-install npm-dev
