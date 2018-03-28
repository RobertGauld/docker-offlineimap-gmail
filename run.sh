#!/bin/bash

# Get latest existing backup
echo "Setting up environment"
LATEST=$( ls -1d /media/destination/????????-???? 2> /dev/null | sed '/^\/media\/destination\/[[:digit:]][[:digit:]][[:digit:]][[:digit:]][[:digit:]][[:digit:]][[:digit:]][[:digit:]]-[[:digit:]][[:digit:]][[:digit:]][[:digit:]]$/!d' | tail -1 | sed 's/[^0-9\-]//g' )
CURRENT=$( date +%Y%m%d-%H%M )

# Copy latest backup if exists, otherwise create empty directory
if [ ! -z $LATEST ]; then
	echo "Copying latest backup to new ($LATEST --> $CURRENT)"
	# No idea why the verbose option is needed but without it the hard links aren't made
	cp -alv /media/destination/$LATEST /media/destination/$CURRENT > /dev/null
else
	echo "Creating empty backup ($CURRENT)"
	mkdir /media/destination/$CURRENT
	mkdir /media/destination/$CURRENT/mail
	mkdir /media/destination/$CURRENT/status
fi

# Create symlink for local status store
echo "Creating symlink for status"
if [ -e /root/.offlineimap ]; then
	rm /root/.offlineimap
fi
ln -s /media/destination/$CURRENT/status /root/.offlineimap

# 'Fix' configuration
sed -e "s/YOUR_EMAIL_ADDRESS/$EMAIL/" -e "s/YOUR_PASSWORD/$PASSWORD/" \
  -e "s/GENERATED_DESTINATION/\/media\/destination\/$CURRENT\/mail/" \
  /root/offlineimaprc > /root/.offlineimaprc

# Do Sync
echo "Performing sync"
exec /usr/bin/offlineimap -c /root/.offlineimaprc
