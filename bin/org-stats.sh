$!/bin/sh 

FILES="${@}"
USERTAG="@jaheppler"

no_files_found()
{
    echo "No files found. Please provide org-mode files as a parameter" >&2
    exit 1
}

[ "x$FILES" = "x" ] && no_files_found

TODO=$(egrep '^\*+.*(TODO|NEXT)' ${FILES}|wc -l)
STARTED=$(egrep '^\*+.*STARTED' ${FILES}|wc -l)
WAITING=$(egrep '^\*+.*WAITING' ${FILES}|wc -l)
CANCELLED=$(egrep '^*+.*CANCELLED' ${FILES}|wc -l)
DONE=$(egrep '^\*+.*DONE' ${FILES}|wc -l)

TOTAL=$(wc -l ${FILES}|grep total)
HEADINGS=$(egrep '^\*+' ${FILES}|wc -l)

USERTAGGED=$(egrep "^\*+.*:${USERTAG}:.*" ${FILES}|wc -l)
OTHERTAGGED=$(egrep '^\*+.*:@.+:.*' ${FILES} | grep -v "${USERTAG}" | wc -l)

OPEN=$(( TODO + STARTED + WAITING ))
FINISHED=$(( CANCELLED + DONE ))
TASKS=$(( OPEN + FINISHED ))
NONTASKS=$(( HEADINGS - TASKS ))

cat <<EOF

Stats for: $FILES

    $HEADINGS headings in $TOTAL lines
        $TASKS task headings
        $NONTASKS non-task headings
        $USERTAGGED tagged with $USERTAG
        $OTHERTAGGED tagged with "@.+" but not "$USERTAG"

    $OPEN open tasks:
        TODO:       $TODO
        STARTED:    $STARTED
        WAITING:    $WAITING

    $FINISHED finished tasks:
        CANCELLED:  $CANCELLED
        DONE:       $DONE

EOF
