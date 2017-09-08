#!/bin/sh
timeout -k 6 5 ls /mnt/wallpapers >/dev/null
rv=$?
if [ ! $rv -eq 0 ]; then
	logger "wallpapers unavailable, restarting service..."
	systemctl --user restart wallpapers-mount.service
	logger "service restart done."
fi

