#!/bin/sh -l

# Arguments
# 1 GITHUB_USER
# 2 REPO_NAME
# 3 SERVER_NAME
# 4 USER_EMAIL
# 5 SERVER_USER (default root)

ssh -i id_rsa $5@$3 "bash -s" < init.sh $1 $2 $3 $4

ssh -i id_rsa $5@$3 "bash -s" < deploy.sh $1 $2
