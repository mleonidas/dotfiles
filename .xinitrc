#!/bin/bash 
# run Xprofile
[ -f ~/.Xprofile ] && . ~/.Xprofile


if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
xhost local:root
exec i3
