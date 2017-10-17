#!/bin/bash

USER="CIRCLE_BOT <>"

CC_GIT_ADDRESS="git+ssh://git@push-par-clevercloud-customers.services.clever-cloud.com/app_dd0692e0-c783-446b-8df9-5e48a61238d8.git"
CC_HOST_IP=212.129.46.93
CC_HOST_NAME="push-par-clevercloud-customers.services.clever-cloud.com"

INITIAL_COMMIT_HASH=`git log -n1 --format="%h"`
COMMIT_MSG="deploying commit $INITIAL_COMMIT_HASH"

function init () {
  cp .htaccess dist/.htaccess
  cd dist
}

function setup_git () {
  git init
  ssh-keyscan -H $CC_HOST_IP >> ~/.ssh/known_hosts
  ssh-keyscan -H $CC_HOST_NAME >> ~/.ssh/known_hosts
  git remote add clever $CC_GIT_ADDRESS
  git fetch --prune clever
  git reset clever/master
}

function publish () {
  git add --all
  git commit --message "$COMMIT_MSG" --author ="$USER"
  git push clever master
}

function main () {
  init && setup_git && publish
}

main