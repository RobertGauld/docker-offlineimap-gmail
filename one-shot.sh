#! /bin/sh

sed -i "s/remoteuser = YOUR_EMAIL_ADDRESS/remoteuser = $EMAIL/" /root/offlineimaprc-one-shot
sed -i "s/remotepass = YOUR_PASSWORD/remotepass = $PASSWORD/" /root/offlineimaprc-one-shot

exec offlineimap -c /root/offlineimaprc-one-shot
