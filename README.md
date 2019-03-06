
Transitional repo for TalentCloud docker integration.

Rebuild from scratch: in this directory, with git and docker-compose installed locally execute the following (from a bash-type shell):

`rm -rf TalentCloud && git clone --single-branch -b dev https://github.com/GCTC-NTGC/TalentCloud.git; docker-compose build && docker-compose up`

After making a hosts entry for talent.local.ca, you should be able to access the application at https://talent.local.ca/


