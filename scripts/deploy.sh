#!/bin/bash

USER_EMAIL="<>"
USER_NAME="CIRCLE_BOT"
CC_GIT_ADDRESS="git+ssh://git@push-par-clevercloud-customers.services.clever-cloud.com/app_dd0692e0-c783-446b-8df9-5e48a61238d8.git"
CC_HOST_IP="212.129.46.93"
CC_HOST_NAME="push-par-clevercloud-customers.services.clever-cloud.com"
INITIAL_COMMIT_HASH=`git log -n1 --format="%h"`
COMMIT_MSG="deploying commit $INITIAL_COMMIT_HASH"


function init() {
  cp .htaccess dist/.htaccess &&
  cd dist
}

function setup_git() {
  git init &&
  git config --global user.email $USER_EMAIL &&
  git config --global user.name $USER_NAME &&
  git remote add clever $CC_GIT_ADDRESS &&
  ssh-keyscan -H $CC_HOST_IP >> ~/.ssh/known_hosts &&
  ssh-keyscan -H $CC_HOST_NAME >> ~/.ssh/known_hosts
}

function publish() {
  git add --all &&
  git commit -m "$COMMIT_MSG" &&
  git push -f clever master
}

function main() {
  init && setup_git && publish
}