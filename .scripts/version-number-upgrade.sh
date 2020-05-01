#!/usr/bin/env bash
sh .scripts/prepare-git.sh

sh prepare-git.sh

if [ $TRAVIS_PULL_REQUEST = "false" ]; then
  echo ">>> Preparing to elevate version number. New Version: $APPLICATION_VERSION"
  git checkout $TRAVIS_BRANCH


  echo ">>> Setting new version number"
  # Set new version in POM
  mvn versions:set -DnewVersion=$APPLICATION_VERSION 
  mvn versions:commit 

  #Set new version in application properties
  newAppVersion=$APPLICATION_VERSION
  sed -i "s/\(motosoup\.version-number=\).*\$/\1${newAppVersion}/" src/main/resources/application.properties

  echo ">>> Pushing changes back to repository..."
  git status
  git add -A
  git commit -m "Updated application version: $APPLICATION_VERSION [ci skip]"
  git push origin HEAD:$TRAVIS_BRANCH
else
  echo ">>> IT'S A PR BUILD! SKIPPING VERSION UPDATE..."
fi