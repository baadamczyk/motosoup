#!/usr/bin/env bash

sh .scripts/prepare-git.sh

echo ">>> Tagging new release"
export CURRENT_COMMIT=$(git rev-parse --short $TRAVIS_COMMIT)

git tag $APPLICATION_NAME-$APPLICATION_VERSION -m "Deployed new stable release"

echo ">> PUSHING TAGS"
git push origin --tags