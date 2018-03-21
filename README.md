# offlineimap-gmail
Use offlineimap to make a backup copies of a gmail/google apps email account.
Each backup is in a directory named in the form yyyymmdd-hhmm, before the sync is started the directory is created by creating hardlinks pointing to the latest existing backup in order to achieve deduplication.


## To use:
1. Set the following environment variables:
  * EMAIL
  * PASSWORD
2. Connect the following to the mount points:
  * /media/destination - the folder to store the backups in

