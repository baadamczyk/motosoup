#!/usr/bin/env bash

#This is startup scipt for MotoSoup application
echo "Starting MotoSoup application - web browser will open. Please wait..."
java -jar bin/MotoSoup.jar --spring.profiles.active=production --spring.main.headless=true &