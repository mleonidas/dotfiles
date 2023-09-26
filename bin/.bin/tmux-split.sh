#!/usr/bin/env zsh
#
tmux set-environment var $PWD

tmux split-window -v -c "#{var}"
