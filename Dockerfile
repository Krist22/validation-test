# Utilisation d'une version spécifique
FROM alpine:3.21.2

# Installation des paquets nécessaires
RUN apk add --no-cache \
    xfce4 \
    xfce4-terminal \
    dbus \
    xvfb \
    xinit \
    x11vnc \
    ttf-dejavu \
    openbox \
    xorg-server \
    xf86-video-dummy \
    ttf-dejavu \
    mesa-dri-gallium \
    pm-utils

# Génération de l'UUID pour DBus
RUN dbus-uuidgen > /var/lib/dbus/machine-id

RUN cp startup.sh /usr/local/bin/startup.sh && chmod +x /usr/local/bin/startup.sh

# Script d'entrée pour démarrer l'environnement graphique et VNC
CMD ["/usr/local/bin/startup.sh"]
