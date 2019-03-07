#!/bin/sh
# execute passed argument after .setup exists

SETUP=/var/www/.setup

if [ ! -f $SETUP ]; then
  echo "waiting for $SETUP to exist"
  while [ ! -f $SETUP ]
    do
      sleep 2
    done
fi

echo "Found setup from `cat $SETUP`, running $1"
$1
echo 'exited'
sleep 100000
