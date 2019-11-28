# SizeAndTimeBasedRollingPolicy-Alternative
SizeAndTimeBasedRollingPolicy in Logback is not removing archived log files correctly before version 1.3.0-alpha1. 
If you are not ready yet to upgrade to that version, then you can use this script to delete the archived log files on a daily basis.

## Script : delete_old_log_files.sh
```
#!/bin/bash
echo delete $2 files older than $3 days in $1
find $1 -name *.$2 -mtime +$3|
while read fname
do
 rm -f $fname
 echo $fname deleted successfully
done
# 
exit 0
```
## Script Parameters : 
1. the folder where the files are stored
2. the type of the files to be deleted
3. to find the files last modified more than n day before

## Next example will delete the 'log' files that were modified 3 days ago in the folder '/logs/archive' 
> ./delete_old_log_files.sh /logs/archive log 3
output
```
delete log files older than 5 days in /logs/archive
```

## Add cron task to run the script on a daily basis at 1:00 am
nano /etc/crontab
0 1 * * * /logs/delete_old_log_files.sh /logs/archive log 3
save by pressing Ctrl+O. 

