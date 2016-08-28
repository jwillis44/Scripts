#Brutally refresh mcx for a machine and all mobile accounts on it

#Clear machine cache
dscl . -list Computers | grep -v "^localhost$" | while read computer_name ; do sudo dscl . -delete Computers/"$computer_name" ; done
echo "Cleared machine MCX cache."
#Get a list of locally cached accounts
for usr in `dscl . -list /Users AuthenticationAuthority | grep LocalCachedUser | awk '{print $1}' | tr '\n' ' '`; do
#Clear mcx caches
dscl . -delete /Users/$usr MCXSettings
echo "Cleared MCXSettings for "$usr
dscl . -delete /Users/$usr MCXFlags
echo "Cleared MCXFlags for "$usr
dscl . -delete /Users/$usr cached_groups
echo "Cleared cached groups for "$usr
#Attempt to refresh from server
mcxrefresh -n $usr
echo "Refreshed preferences for "$usr; done
