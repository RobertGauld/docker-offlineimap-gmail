#!/bin/bash

# Get latest existing backup
LATEST=$( ls -1d /media/destination/*/ 2> /dev/null | tail -1 | sed 's/[^0-9\-]//g' )
CURRENT=$( date +%Y%m%d-%H%M )

# Copy lastest backup if exists, otherwise create empty directory
if [ -e $LATEST ]; then
	cp -al /media/destination/$LATEST /media/destination/$CURRENT
else
	mkdir /media/destination/$CURRENT
fi

# 'Fix' configuration
cp /root/offlineimaprc /root/.offlineimaprc
sed -e "s/YOUR_EMAIL_ADDRESS/$EMAIL/" -e "s/YOUR_PASSWORD/$PASSWORD/" \
  -e "s/GENERATED_DESTINATION/\/media\/destination\/$CURRENT/" \
  /root/offlineimaprc > /root/.offlineimaprc


# Do Sync
exec /usr/bin/offlineimap -c /root/.offlineimaprc
