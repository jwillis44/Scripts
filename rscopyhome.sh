	#!/bin/sha
	#Copy Userdata to new laptop
	echo "Enter Username"
	read username
	echo  "Enter Hostname"
	read hostname
	echo "\n\n You Entered the following: Username = $username hostname = $hostname"
rsync -avhe ssh --progress  --exclude '.*' --exclude 'Documents/Microsoft*' --include '/*' --include 'Desktop/***' --include 'Documents/***' --include 'Music/***' --include 'Movies/***' --include '/Pictures/***' --include '/Library' --include '/Library/Safari/***' --include /Library/Application\ Support/ --include '/Library/Application\ Support/Mozilla/***' --include '/Library/Application\ Support/Firefox/***' --exclude '*' root@$hostname:/Users/$username/ /Users/$username

