#!/usr/bin/env bash

selected=`cat ~/.cht-languages.txt ~/.cht-command.txt | fzf`

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.cht-languages.txt; then
    query=`echo $query | tr ' ' '+'`
    tmux neww "curl -s cht.sh/$selected/$query & while [ : ]; do sleep 1; done "
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
