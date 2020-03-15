#!/usr/bin/env bash

if [ $TRAVIS_PULL_REQUEST = "false" ]; then
  echo ">>> Upgrading Version Number. New Version: $APPLICATION_VERSION"
 
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git config --global push.default simple
  git remote set-url origin https://${GITHUB_TOKEN}@github.com/baadamczyk/motosoup.git
  git checkout $TRAVIS_BRANCH


  #Set new version in POMs
  mvn versions:set -DnewVersion=$APPLICATION_VERSION 
  mvn versions:commit 

  #Set new version in application properties
  cd applogic/src/main/resources
  newAppVersion=$APPLICATION_VERSION
  sed -i "s/\(motosoup\.version-number=\).*\$/\1${newAppVersion}/" application.properties

  #Repush to the repository
  git status
  git add -A
  git commit -m "Updated application version: $APPLICATION_VERSION [ci skip]"
  git push origin HEAD:$TRAVIS_BRANCH
else
  echo ">>> IT'S A PR BUILD! SKIPPING VERSION UPDATE..."
fi