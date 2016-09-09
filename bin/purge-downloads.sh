# Purge old downloads
# http://jasonheppler.org/2012/06/07/automating-tasks/
find /Users/jasonheppler/Downloads/* -mtime +1 -exec mv {} /Users/jheppler/.Trash/ \;