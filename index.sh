#!/usr/bin/env sh

_() {
  YEAR="1970"
  echo "GitHub Username: "
  read -r USERNAME
  echo "GitHub Access token: "
  read -r ACCESS_TOKEN

  [ -z "$USERNAME" ] && exit 1
  [ -z "$ACCESS_TOKEN" ] && exit 1  
  [ ! -d $YEAR ] && mkdir $YEAR

  cd "${YEAR}" || exit
  git init
  git add .
  GIT_AUTHOR_DATE="${YEAR}-01-01T00:00:00.000Z" \
    GIT_COMMITTER_DATE="${YEAR}-01-01T00:00:00.000Z" \
    git commit --allow-empty
  git remote add origin "https://${ACCESS_TOKEN}@github.com/${USERNAME}/${YEAR}.git"
  git branch -M 1970
  git push -u origin 1970 -f
  cd ..
  rm -rf "${YEAR}"

  echo
  echo "Cool, check your profile now: https://github.com/${USERNAME}"
} && _

unset -f _
