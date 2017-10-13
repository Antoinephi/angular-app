#!/bin/bash

cp ../.htaccess ../dist/.htaccess &&
cd ../dist &&
git init &&
git config --global user.email "<>" &&
git config --global user.name "Antoine" &&
git remote add clever git+ssh://git@push-par-clevercloud-customers.services.clever-cloud.com/app_dd0692e0-c783-446b-8df9-5e48a61238d8.git &&
git add --all &&
git commit -m "commit message --author Antoine <>" && 
ssh-keyscan -H 212.129.46.93 >> ~/.ssh/known_hosts &&
ssh-keyscan -H push-par-clevercloud-customers.services.clever-cloud.com >> ~/.ssh/known_hosts &&
pwd &&
git push -f clever master
