#!/bin/bash
# This script will disable printer sharing on each printer installed on macOS
#
#
InstalledPrinters=$( lpstat -a | cut -d " " -f 1 )
SelectPrinters=$( echo "$InstalledPrinters" | grep _ )
#
for P in ${InstalledPrinters}
 do
    lpadmin -p $P -o printer-is-shared=false
 
 done
exit
# end of script
