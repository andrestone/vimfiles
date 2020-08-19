#!/bin/sh
# Usage: ./rmsubmodule.sh <path_to_submodule>

git submodule deinit -f $1
git rm -f $1 
git add --all
git commit -m "Removed submodule $1"
rm -rf .git/modules/$1
