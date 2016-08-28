#! /bin/bash

##
## LoginHook script by Tim Schutt, 2013
###!/bin/bash
logfile=/var/log/redirect.log
exec > $logfile 2>&1l
echo "##############################"
echo "Logging in user is $1"
echo "Testing to see if folder structure exists"
if [[ -d "/Volumes/$1\$/Desktop" ]]; 


if [ ! "$1" = "admin" ] && [ ! "$1" = "root" ]; then ## test if the user is local admin or not
    echo "Reassigning Desktop folder."
        
    rm -r /Users/$1/Desktop                     ## remove Desktop folder created by OS X
    ln -s /Volumes/$1\$/Desktop /Users/$1       ## create soft-link to Desktop folder in AD home
        
    echo "Reassigning Documents folder."
    rm -r /Users/$1/Documents                     ## remove Docs folder created by OS X
    ln -s /Volumes/$1\$/Documents /Users/$1     ## create soft-link to Docs folder in AD home
	
	echo "Reassigning Library Preferences"
	rm -r /Users/$1/Library/Preferences
	ln -s /Volumes/$1/$/Library/Preferences Users/$1/Library/	
fi 
echo "##############################"

exit 0