#!/usr/bin/env bash

. .scripts/var.sh

echo ">>> Creating Win32 redistributable package..."

echo ">>> Copying run executable..."
if [ -f "$SOURCEDIR/$LINUX_RUN_SCRIPT" ]; then
    rm "$SOURCEDIR/$LINUX_RUN_SCRIPT"
fi
cp executables/$WIN32_RUN_SCRIPT $SOURCEDIR

echo ">>> Creating redistributable ZIP package..."
cd $SOURCEDIR
zip -r "$APPLICATION_NAME-$APPLICATION_VERSION-$WIN32_ARCHIVE_SUFFIX.zip" *


cd ../..
mv $SOURCEDIR/"$APPLICATION_NAME-$APPLICATION_VERSION-$WIN32_ARCHIVE_SUFFIX.zip" $PACKAGEDIR