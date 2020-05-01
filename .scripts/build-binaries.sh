#!/usr/bin/env bash

source .scripts/var.sh

# TODO: DELETE THIS BEFORE PUSH
TRAVIS_BRANCH=development

echo ">>> Pulling version-updated codebase..."
git pull origin $TRAVIS_BRANCH

echo ">>> Building JAR package..."
# TODO: UNCOMMENT BEFORE PUSH
# mvn clean package -Pproduction -DskipTests

echo ">>> Creating deployment workdir..."
if [ -d $WORKDIR ]; then
    rm -rf $WORKDIR
fi
mkdir $WORKDIR
mkdir $SOURCEDIR

echo ">>> Copying JAR file..."
mkdir $SOURCEDIR/bin
cp target/MotoSoup.jar $SOURCEDIR/bin/MotoSoup.jar


echo ">>> Creating package dir..."
mkdir $PACKAGEDIR
sh .scripts/prepare-package-windows.sh
sh .scripts/prepare-package-linux.sh