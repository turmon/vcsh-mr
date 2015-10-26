#!/bin/sh
#
# create new repository line from template
#
# one arg: the name of the repo (e.g., vi).
# we assume the name of the remote repo is vcsh-vi
#
if [ $# == 1 ]; then
  repo="$1"
  repo_fn="$repo.vcsh"
  echo "Creating \`$repo_fn' here."
  # delete ## lines
  sed "/^##/d;s/REPOS/$repo/g" Template.vcsh > $repo_fn
  echo "Might want to:"
  echo "(cd ../config.d && ln -s '../available.d/$repo.vcsh')"
else
  echo "Need an argument: the repository name"
  exit 1
fi
