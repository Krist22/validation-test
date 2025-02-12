FROM alpine:3.21.2

# Installation des paquets nécessaires
RUN apk add --no-cache \
    xfce4 \
    xfce4-terminal \
    dbus \
    xvfb \
    x11vnc \
    ttf-dejavu \
    openbox \
    pm-utils

# Génération de l'UUID pour DBus
RUN dbus-uuidgen > /var/lib/dbus/machine-id

# Script d'entrée pour démarrer l'environnement graphique et VNC
CMD Xvfb :1 -screen 0 1024x768x16 & \
    export DISPLAY=:1 && \
    dbus-daemon --system & \
    startxfce4 & \
    x11vnc -display :1 -forever
