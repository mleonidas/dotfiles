#!/bin/sh

shout() { echo "$0: $*" >&2; }
barf() { shout "$*"; exit 111; }
try() { "$@" || barf "cannot $*"; }

if [[ $? != 0 ]]; then
  echo "what the fuck meng"
fi

var="modified"
