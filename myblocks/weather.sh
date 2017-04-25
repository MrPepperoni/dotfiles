#!/bin/bash

function get_weather()
{
    tmp=/tmp/ansiweather_cache
    if [ ! -f $tmp ]; then
        ANSIWEATHERRC=/home/w12x/.ansiweatherrc /home/w12x/src/ansiweather/ansiweather > $tmp
    fi
    tail -n 1 $tmp
}

get_weather

