
# TalentCloud docker integration


## Run the stack

To get started, clone the TalentCloud repo to this directory, then build and run using docker-compose.

```
$ git clone --single-branch -b dev https://github.com/GCTC-NTGC/TalentCloud.git 
$ docker-compose build 
$ docker-compose up
```

This repository should work cross-platform (tested on Linux, Mac and Windows).

Note a single branch deploy may not be suitable for ongoing development; use a regular `git clone` in that case.

Make a hosts entry for talent.local.ca that points to localhost, you should then be able to access the application at https://talent.local.ca/ (you will need to accept the self-signed certificate).

## Components

* nginx (front-end); ports 80 443
* talentcloud-op: asserts environment and used for ongoing development
* talentcloud: the php-fpm application
* Postgres
