#!/bin/sh -l

echo "1: $1"
echo "2: $2"
echo "3: $3"
echo "4: $4"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
