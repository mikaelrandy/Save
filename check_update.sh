#!/bin/sh

# Ensure we are in current file directory
cd $(dirname $0)

STATUS=`git status --short`

if [ `echo $STATUS | wc -l` -gt 0 ]; then
    echo "[LOCAL] Attention, des modifications locales doivent être commitées"
else
    echo "[LOCAL] Aucune modification"
fi

exit 0