#!/bin/sh
# Changes macOS Search Path from /All Domains to FQDN allowing for correct opperation of MCX
#
# Var's need data !!
# NBSN - Netbios Short name
# NBSN=corp
NBSN=
#
#FQDN=corp.contoso.com
FQDN=
#
#
# Delete Current Search Path
dscl /Search -delete / CSPSearchPath "/Active Directory/$NBSN/All Domains"
dscl /Search/Contacts -delete / CSPSearchPath "/Active Directory/$NBSN/$FQDN"
# Add Correct Search Path
dscl /Search -append / CSPSearchPath "/Active Directory/$NBSN/$FQDN"
sleep 10
# Add Contacts search path
dscl /Search/Contacts -append / CSPSearchPath "/Active Directory/$NBSN/$FQDN"
sleep 10
exit
#end of script
