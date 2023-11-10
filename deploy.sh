#! /bin/bash

# Arguments
# 1 REPO_URL

# Command
# ssh -i ~/.ssh/id_rsa root@host "bash -s" < deploy.sh REPO_OWNER REPO_URL

echo "deploy.sh found"

git config --global user.name "Github Actions"
git config --global user.email "actions@github.com"

rm -rf repo

git clone $1 repo
cd ~/repo

npm install
pm2 start server.mjs -f

pm2 startup
pm2 save
