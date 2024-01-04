#!/usr/bin/bash

playerctl status --player=spotify | grep "Playing">&/dev/null
if [[ $? = 0 ]]; then 
    playerctl metadata --player=spotify --format "{{trunc(artist, 16)}} - {{trunc(title, 32)}}"
else
    echo "Puased"
fi
