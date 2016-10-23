 for i in $(cat * | awk '{print $1}' | sort -n | uniq); do cat * | grep "$i" ; echo -e "\n"; done 
