#!/bin/bash
# Usage: ./add_submodule.sh <git_url>
url=$1
pname=${url##*/}
if [[ !  -z  $2  ]];then
  branch="--branch $2"
else
  branch=""
fi
git submodule add $branch $1 ./pack/andrestone/start/$pname

