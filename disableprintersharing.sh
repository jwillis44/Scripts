#!/bin/bash
 
InstalledPrinters=$( lpstat -a | cut -d " " -f 1 )
SelectPrinters=$( echo "$InstalledPrinters" | grep _ )
 
for P in ${InstalledPrinters}
do
    lpadmin -p $P -o printer-is-shared=false
 
done
date=$( date "+%m/%d/%y" )
echo "Yes on $date"
