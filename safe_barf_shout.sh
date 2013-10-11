#!/bin/sh

shout() { echo "$0: $*" >&2; }
barf() { shout "$*"; exit 111; }
safe() { "$@" || barf "cannot $*"; }

