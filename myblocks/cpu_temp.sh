#!/bin/bash

function get_temp()
{
    sensors -u | grep _input | awk '{ print $2; }' | awk -F. '{ print $1; }' | sort | tail -n 1
}


echo "$(get_temp)°C"

