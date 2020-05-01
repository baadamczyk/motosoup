#!/usr/bin/env bash

. .scripts/var.sh

echo "Creating Linux redistributable package..."

echo ">>> Copying run executable..."
if [ -f "$SOURCEDIR/$WIN32_RUN_SCRIPT" ]; then
    rm "$SOURCEDIR/$WIN32_RUN_SCRIPT"
fi
cp executables/$LINUX_RUN_SCRIPT $SOURCEDIR

echo ">>> Creating redistributable TAR.GZ package..."
cd $SOURCEDIR
tar -czf ../package/"$APPLICATION_NAME-$APPLICATION_VERSION-$LINUX_ARCHIVE_SUFFIX.tar.gz" *

cd ../..