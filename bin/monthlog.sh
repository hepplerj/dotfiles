#!/bin/bash

# Generates current month, or choose a previous month to generate:
#   monthlog 1   - last month
#   monthlog 2   - month before that..

# before you start, on macOS, you need coreutils for `gdate` to work.
# brew install coreutils
prev_month=$1

if [[ -n "$prev_month" ]]
then
    myyearmonth=$(gdate -d "- $prev_month months" +"%Y-%m")
else
    myyearmonth=$(gdate +"%Y-%m")
fi
mydate="$myyearmonth-01" # first day of month

# pretty month heading for wiki
echo
echo '== $(gdate -d "$mydate" +"%Y %B") =='
echo
echo '$(gdate -d "$mydate" +"%Y-%m-month-wrapup")'

# start with day 31, loop back to 1 and generate date string
day=31
while [[ $day -gt -1 ]]
do
    date=$(gdate -d "$mydate + $day days" +"%F-%a")
    date_noweekday=$(gdate -d "$mydate + $day days" +"%F") # for wrapups of all kinds

    # 7-day wrapup
    day_of_month=$(gdate -d "$mydate + $day days" +"%-d")
    [[ $(($day_of_month % 7)) == 0 ]] && echo "${date_noweekday}-wrapup" | grep "$myyearmonth"

    echo "$date" | grep "$myyearmonth" # only show dates in this month
    day=$(( day - 1 )) # decrement
done

echo