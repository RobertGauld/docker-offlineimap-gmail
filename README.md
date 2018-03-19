# offlineimap-gmail
Use offlineimap to make a backup copy of a gmail/google apps email account.


## To use:
1. Set the following environment variables:
  * YOUR_EMAIL_ADDRESS
  * YOUR_PASSWORD
2. Connect the following to the mount points:
  * /media/destination - the folder to store the backups in
3. Either
  * Run the container and it will perform a full backup every 24 hours (with a quick update every hour).
  * Run the container using /root/one-shot.sh as the entry point to do a one time sync.

