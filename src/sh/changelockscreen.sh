#!/bin/zsh
ofile=/tmp/lockbg.png
idir=/mnt/wallpapers
find $idir -type f | sort -R | head -2 | while read line1; read line2; do convert -gamma 0.45 -blur 25x12 +append $line1 $line2 $ofile; break; done
print $ofile

