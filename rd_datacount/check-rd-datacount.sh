. /etc/profile
. ~/.bash_profile
pdsh -w 10.246.67.[171-180] /home/ulss/project/ulss-data-redistribution/datacount.sh $1 $2 2>/dev/null | awk 'BEGIN{sum=0}{sum+=$NF}END{print sum}'
