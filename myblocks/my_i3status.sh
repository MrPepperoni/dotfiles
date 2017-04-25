#!/bin/bash
# Public Domain
# (someone claimed the next lines would be useful for…
#  people. So here goes: © 2012 Stefan Breunig
#  stefan+measure-net-speed@mathphys.fsk.uni-heidelberg.de)

# append i3status output to the measure-net-speed’s one.
# the quote and escape magic is required to get valid
# JSON output, which is expected by i3bar (if you want
# colors, that is. Otherwise plain text would be fine).
# For colors, your i3status.conf should contain:
# general {
#   output_format = i3bar
# }

# i3 config looks like this:
# bar {
#   status_command measure-net-speed-i3status.bash
# }

function json_escape(){
  echo -n "$@" | python -c 'import json,sys; print json.dumps(sys.stdin.read())'
  }

function get_weather()
{
    tmp=/tmp/ansiweather_cache
    if [ ! -f $tmp ]; then
        ANSIWEATHERRC=/home/w12x/.ansiweatherrc /home/w12x/src/ansiweather/ansiweather > $tmp
    fi
    tail -n 1 $tmp
}

function get_temp()
{
    sensors -u | grep _input | awk '{ print $2; }' | awk -F. '{ print $1; }' | sort | tail -n 1
}

i3status | (read line && echo $line && read line && echo $line && while :
do
    read line
    dat="$(tail -n 1 /home/w12x/siddhartha/.irssi/fnotify)"
    weather=$(json_escape "$(get_weather)")
    dat=$(json_escape ${dat})
    cputemp=$(json_escape "$(get_temp)°C")
    dat="[{ \"full_text\": ${dat} },{ \"full_text\": ${weather} },{ \"full_text\": ${cputemp} },"

    echo "${line/[/$dat}" || exit 1
done)
