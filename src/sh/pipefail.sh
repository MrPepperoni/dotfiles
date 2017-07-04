#!/bin/bash
set -o pipefail
logfile="/tmp/pipe.log"
rm $logfile

function run()
{
	eval "$@" |& tee -a $logfile || exit 1
}

run echo pina
run make asd
run echo bump

