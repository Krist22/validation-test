#!/bin/sh

# Démarrage de Xvfb
Xvfb :1 -screen 0 1024x768x16 & 
export DISPLAY=:1

# Démarrage des services
dbus-daemon --system & 
startxfce4 & 
x11vnc -display :1 -forever &

# Attente pour que l'environnement graphique soit prêt
sleep ${BROWSER_WAIT}

# Lancement du navigateur avec l'URL spécifiée
/usr/bin/firefox --no-remote --new-window ${START_URL} &

# Attente infinie pour maintenir le conteneur en vie
wait
