#!/bin/bash

# Remove the current site
ssh root@45.55.237.204 'rm -Rf /var/www/afaa.hyprtxt.com/static_generated'
# SCP the new build
scp /var/cache/drone/src/bitbucket.org/sportsmedicine/afaa.hyprtxt.com/static_generated root@45.55.237.204:/var/www/afaa.hyprtxt.com/static_generated/
echo 'Deploy Success!'
