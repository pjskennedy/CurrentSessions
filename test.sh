#!/bin/sh

open '/Applications/itunes.app'
open '/Applications/postgres.app'
open '/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl .'
open '/Applications/iTerm\ 3.app'

rails c

pwd=`pwd`
osascript -e "tell application \"Terminal\"" \
    -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
    -e "do script \"cd $pwd; clear\" in front window" \
    -e "end tell"
    > /dev/null

rails s

pwd=`pwd`
osascript -e "tell application \"Terminal\"" \
    -e "tell application \"System Events\" to keystroke \"t\" using {command down}" \
    -e "do script \"cd $pwd; clear\" in front window" \
    -e "end tell"
    > /dev/null