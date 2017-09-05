#!/bin/zsh
proc=$(pgrep "i3lock")
rv=$?
echo $proc $rv
if [ $rv -eq 0 ]; then
	~/src/sh/changelockscreen.sh
	for p in $(echo $proc); do
		kill -SIGUSR2 $p
	done
fi

