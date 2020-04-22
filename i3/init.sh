#!/usr/bin/env bash

xrandr --output DP-0 --primary --mode 1920x1080 --rate 84.90 --output DVI-I-1 --mode 1920x1080 --rate 84.90 --right-of DP-0

i3-msg 'workspace 1; exec firefox'
i3-msg 'workspace 2; exec konsole'

polybar --list-monitors | cut -d":" -f1 >> /tmp/poly.txt

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload example &
done
