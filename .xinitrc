#!/bin/bash 
# run Xprofile
[ -f ~/.Xprofile ] && . ~/.Xprofile


if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

exec i3
