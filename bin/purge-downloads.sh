# Purge old downloads
# http://jasonheppler.org/2012/06/07/automating-tasks/
find /Users/jheppler/Downloads/* -mtime +1 -exec mv {} /Users/jheppler/.Trash/ \;