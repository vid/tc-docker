#!/bin/sh

make -f $OPROOT/Makefile clean gen-certs env composer-install laravel-init fresh-db fake-data npm-install-cross-env-global npm-install npm-dev && \