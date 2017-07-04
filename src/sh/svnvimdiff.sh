#!/bin/sh
tmpf=$(mktemp)
cp ${6} ${tmpf}
/usr/bin/vimdiff ${tmpf} ${7}
rm -rf ${tmpf}

