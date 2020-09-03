#!/bin/bash
# Usage: ./add_submodule.sh <git_url>
url=$1
pname=${url##*/}
if [[ !  -z  $param  ]];then
  branch="--branch $2"
else
  branch=""
fi
git submodule add --depth 1 $branch $1 ./pack/andrestone/start/$pname
