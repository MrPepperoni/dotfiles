#!/bin/zsh
ofile=/tmp/lockbg.png
idir=~/wallpapers_w/nsfw
find $idir -type f | sort -R | head -1 | while read line1; do convert -gamma 0.45 -blur 25x12 $line1 $ofile; break; done
print $ofile

