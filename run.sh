#! /bin/sh

sed -i "s/remoteuser = YOUR_EMAIL_ADDRESS/remoteuser = $EMAIL/" /root/offlineimaprc-keep-syncing
sed -i "s/remotepass = YOUR_PASSWORD/remotepass = $PASSWORD/" /root/offlineimaprc-keep-syncing

exec offlineimap -c /root/offlineimaprc-keep-syncing
