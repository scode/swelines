#!/bin/bash

set -euo pipefail

./hacks/build.sh

git fetch

# Get index.html out of the way so that 'git checkout' won't fail.
mv index.html index.html.tmp
headrev=$(git rev-parse HEAD)
git checkout gh-pages
git merge --ff-only origin/gh-pages
mv index.html.tmp index.html
git add index.html
git commit -m "autodeploy: rendered version from $headrev"
git push
git checkout master

