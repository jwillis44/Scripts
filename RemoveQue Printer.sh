#!/bin/sh

#  Remove Que Printer.sh
#  
#
#  Created by OSX Administrator on 8/22/16.
#
# Return Printer Path lpstat -v | awk '/que/  {print $4}'
# Return Printer Name lpstat -v | awk '/que/ -F "/" {print $3}'
# Return Printer name w/o trailing colon
logfile=/var/log/lpstat.log
echo "\n Starting Script $(DATE)" > $logfile
for Printer_Name in $(lpstat -v |grep que | awk '/que/ -F "/" {print $3}' | cut -d: -f1); do
echo "\n removing printer ${Printer_Name}" >> $logfile
echo "Running Command (/usr/sbin/lpadmin -x ${Printer_Name} | cut -d: -f1R)"
if /usr/sbin/lpadmin -x ${Printer_Name} ; then
    echo "\n Success on printer $Printer_Name}" >> $logfile
else
    echo "\n Failed to remove printer: ${Printer_Name}" >> $logfile
fi
done
exit 0
