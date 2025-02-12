#!/bin/sh

Xvfb :1 -screen 0 1024x768x16 & 
export DISPLAY=:1
dbus-daemon --system & 
startxfce4 & 
x11vnc -display :1 -forever
