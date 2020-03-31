#!/bin/bash
val=`date '+(W%V) %Y-%m-%d %H:%M:%S'`
col='#ffffff'
tgt=$(basename $(readlink -f ~/wallpapers_w/actual))
if [ "$tgt" = "nsfw" ]; then
    col='#ff0000'
fi
echo "{ \"full_text\": \"$val\", \"color\": \"$col\" }"

