#!/bin/bash
# Usage: ./add_submodule.sh <git_url>
url=$1
pname=${url##*/}
git submodule add --depth 1 $1 ./pack/andrestone/start/$pname
