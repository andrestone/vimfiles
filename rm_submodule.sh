#!/bin/sh
# Usage: ./rmsubmodule.sh <path_to_submodule>

git submodule deinit $1
git rm $1 
git commit -m "Removed submodule {$1}"
rm -rf .git/modules/$1
