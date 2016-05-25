#!/bin/bash

[ -f ~/.Xprofile ] && . ~/.Xprofile



if [ -f ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

xhost local:root

eval $(ssh-agent)
exec i3
