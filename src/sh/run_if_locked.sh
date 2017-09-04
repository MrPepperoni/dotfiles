#!/bin/zsh
pgrep i3lock >/dev/null
rv=$?
if [ $rv -eq 0 ]; then
	/home/aujvary/src/sh/changelockscreen.sh
fi

