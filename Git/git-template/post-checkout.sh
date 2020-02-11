#!/bin/bash

PREV_COMMIT=$1
POST_COMMIT=$2

if [[ '0000000000000000000000000000000000000000' == $PREV_COMMIT ]] ; then exit 0; fi

NOCOLOR='\e[0m'
REDCOLOR='\e[37;41m'

if [[ -f composer.lock ]]; then
    DIFF=`git diff --shortstat $PREV_COMMIT..$POST_COMMIT composer.lock`
    if [[ $DIFF != "" ]]; then
        echo -e "$REDCOLOR composer.lock has changed. You must run composer install$NOCOLOR"
    fi
fi

if [[ -f package.json ]]; then
    DIFF=`git diff --shortstat $PREV_COMMIT..$POST_COMMIT package.json`
    if [[ $DIFF != "" ]]; then
        echo -e "$REDCOLOR package.json has changed. You must run npm install$NOCOLOR"
    fi
fi

if [[ -f yarn.lock ]]; then
    DIFF=`git diff --shortstat $PREV_COMMIT..$POST_COMMIT yarn.lock`
    if [[ $DIFF != "" ]]; then
        echo -e "$REDCOLOR yarn.lock has changed. You must run yarn$NOCOLOR"
    fi
fi

if [[ -f chef/Cheffile.lock ]]; then
    DIFF=`git diff --shortstat $PREV_COMMIT..$POST_COMMIT chef/Cheffile.lock`
    if [[ $DIFF != "" ]]; then
        echo -e "$REDCOLOR chef/Cheffile.lock has changed. You must run librarian-chef install$NOCOLOR"
    fi
fi