#!/usr/bin/env bash

. .scripts/var.sh

echo ">>> Pulling version-updated codebase..."
git pull origin $TRAVIS_BRANCH

echo ">>> Building JAR package..."
 mvn clean package -q -B -V -Pproduction -DskipTests

echo ">>> Creating deployment workdir..."
if [ -d $WORKDIR ]; then
    rm -rf $WORKDIR
fi
mkdir $WORKDIR
mkdir $SOURCEDIR

echo ">>> Copying JAR file..."
mkdir $SOURCEDIR/bin
cp target/$JAR_NAME $SOURCEDIR/bin/$JAR_NAME

echo ">>> Creating package dir..."
mkdir $PACKAGEDIR
sh .scripts/prepare-package-windows.sh
sh .scripts/prepare-package-linux.sh