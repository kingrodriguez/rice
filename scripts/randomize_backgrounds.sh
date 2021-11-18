#!/usr/bin/env bash

cd /usr/share/backgrounds/ || exit

background_home=$HOME/Pictures/wallpaper

# Shuffle backgrounds and pick one
background=$(find "$background_home" -type f | shuf -n 1)

# Replace current LightDM greeter background
cp "$background_home"/"$background" background.jpg
