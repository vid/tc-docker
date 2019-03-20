
# TalentCloud docker integration

To get started, clone the TalentCloud repo to this directory, then build and run using docker-compose.

```
$ git clone --single-branch -b dev https://github.com/GCTC-NTGC/TalentCloud.git 
$ docker-compose build 
$ docker-compose up`
```

This repository should work cross-platform (tested on Linux, Mac and Windows).

Note a single branch deploy may not be suitable for ongoing development; use a regular `git clone` in that case.

After making a hosts entry for talent.local.ca, you should be able to access the application at https://talent.local.ca/


