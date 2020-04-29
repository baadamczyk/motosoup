#!/usr/bin/env bash

# TODO: Pull before release
# TODO: mvn clean package -DskipTests
# TODO: determine common name for achive (application name and version are already in .travis.yml)
# TODO: Create temp build directory
# TODO: Copy jar from /target to /temp/bin
# TODO: Run Windows packaging script (result should be zip archive: /temp/output/motosoup-0.1.123-windows.zip)
# TODO: Run unix packaging script (result should be tar.gz archive: /temp/output/motosoup-0.1.123-linux.tar.gz)
# TODO: Make github batch release with created archives