#!/bin/bash
echo delete $2 files older than $3 days in $1
find $1 -name *.$2 -mtime +$3|
while read fname
do
 rm -f $fname
 echo $fname deleted successfully
done
# good exit
exit 0
