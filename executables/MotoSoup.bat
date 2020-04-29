@ECHO OFF 

::This is startup scipt for MotoSoup application
TITLE MotoSoup - The automotive ad aggregator
ECHO Starting MotoSoup application - web browser will open. Please wait...
java -jar bin/MotoSoup.jar --spring.profiles.active=production --spring.main.headless=true &
PAUSE