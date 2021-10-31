#!/bin/bash 
# A really simple, non-destructive to-do checklist manager.
#
# Usage: ./cheque todo.txt

# Get list from file or STDIN
[ -f "$1" ] && list="$(cat "$1")" || list="$(cat)"

# Print lines
printlist () {
    printf "%s" "$list"
}

strikeitem() {
    printlist \
        | grep -v "^$line$" \
        | sed '$ s/\n$//'
}

# Loop list and remove checked items
i="$(printlist | wc -l)"
while [ $i != -1 ]; do 
    line="$(printlist | fzf --layout=reverse)"
    list="$(strikeitem)"
    i=$((i-1))
done
