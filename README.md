
# TalentCloud docker integration

Run and develop with just git and docker-compose.  Tested on Linux, Mac and Windows.

## Run the stack

To get started, clone the TalentCloud repo to this directory, 
then build and run using docker-compose.

```
$ git clone --single-branch -b dev https://github.com/GCTC-NTGC/TalentCloud.git 
$ docker-compose build 
$ docker-compose up
```


Note a single branch deploy may not be suitable for ongoing development; use a regular `git clone` in that case.

Make a hosts entry for talent.test that points to localhost, 
you should then be able to access the application at https://talent.test/ 
(you will need to accept the self-signed certificate).

Once this is all set up, development commands can be run from the host system in the running talentcloud-op container. 
First, retrieve the container ID using `docker ps`, 
then use commands like this: `docker exec -it (talentcloud-op-id) make <command>`, 
where command is from [op/Makefile](the Makefile).

## Components

* nginx (front-end) exposed on ports 80, 443
* talentcloud-op: asserts environment and used for ongoing development
* talentcloud: the php-fpm application
* Postgres
* adminer exposed on port 8060
