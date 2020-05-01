#!/usr/bin/env bash

echo ">>> Tagging new release"

export CURRENT_COMMIT=$(git rev-parse --short $TRAVIS_COMMIT)

# TODO: Remove this
echo ">>> CURRENT COMMIT: $CURRENT_COMMIT"

git tag $APPLICATION_VERSION $CURRENT_COMMIT
git tag -af $APPLICATION_VERSION $CURRENT_COMMIT -m "Deployed release: $APPLICATION_VERSION [ci skip]"

echo ">> PUSHING TAGS"
git push origin $APPLICATION_VERSION