#!/bin/sh -l

# Arguments
# 1 GITHUB_USER
# 2 REPO_NAME
# 3 SERVER_NAME
# 4 USER_EMAIL
# 5 SERVER_USER (default root)
# 6 SERVER_HOST

ssh -i id_rsa $5@$6 "bash -s" < init.sh $1 $2 $3 $4
