#!/usr/bin/env bash

. .scripts/var.sh
sh .scripts/prepare-git.sh

if [ $TRAVIS_PULL_REQUEST = "false" ]; then
  echo ">>> Preparing to elevate version number. New Version: $APPLICATION_VERSION"
  git checkout $TRAVIS_BRANCH

  echo ">>> Setting new version number"
  # Set new version in POM
  mvn versions:set -q -B -DnewVersion=$APPLICATION_VERSION 
  mvn versions:commit -q -B

  #Set new version in application properties
  newAppVersion=$APPLICATION_VERSION
  sed -i "s/\(motosoup\.version.number=\).*\$/\1${newAppVersion}/" $MAIN_PROPERTY_FILE_REF

  echo ">>> Pushing changes back to repository..."
  git add -A
  git commit -m "Updated application version: $APPLICATION_VERSION [ci skip]"
  git push origin HEAD:$TRAVIS_BRANCH
else
  echo ">>> IT'S A PR BUILD! SKIPPING VERSION UPDATE..."
fi