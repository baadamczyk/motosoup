#!/usr/bin/env bash

echo ">>> Configuring git credentials"
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git config --global push.default simple
git remote set-url origin https://${GITHUB_TOKEN}@github.com/baadamczyk/motosoup.git