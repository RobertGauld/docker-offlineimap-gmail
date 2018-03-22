# offlineimap-gmail
Use offlineimap to make a backup copies of a gmail/google apps email account.
Each backup is in a directory named in the form yyyymmdd-hhmm, before the sync is started the directory is created by creating hardlinks pointing to the latest existing backup in order to achieve deduplication.


## To use:
1. Set the following environment variables:
  * EMAIL
  * PASSWORD
2. Connect the following to the mount points:
  * /media/destination - the folder to store the backups in

## Example shell command (replace the stuff in all capitals starting YOUR_):
```
docker run --rm --volume="YOUR_PATH_FOR_BACKUPS:/media/destination"  --env="EMAIL=YOUR_EMAIL_ADDRESS" --env="PASSWORD=YOUR_PASSWORD" robertgauld/offlineimap-gmail:latest
```