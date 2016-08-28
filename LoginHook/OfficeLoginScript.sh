#! /bin/bash

##
##
##

echo "##############################"
echo "Logging in user is $1"

if [ ! "$1" = "admin" ] && [ ! "$1" = "root" ]; then ## test if the user is local admin or not
    echo "Reassigning Desktop folder."
        
    rm -r /Users/$1/Desktop                     ## remove Desktop folder created by OS X
    ln -s /Volumes/OfficeR\$/$1/Desktop /Users/$1       ## create soft-link to Desktop folder in AD home
        
    echo "Reassigning Documents folder."
    rm -r /Users/$1/Documents                     ## remove Docs folder created by OS X
    ln -s /Volumes/OfficeR\$/$1/Documents /Users/$1     ## create soft-link to Docs folder in AD home

fi 
echo "##############################"

exit 0
