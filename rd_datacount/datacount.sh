. /etc/profile
. ~/.bash_profile
if [ $# -ne 2 ];then
	cat <<EOF
	Usage:
		datacount.sh date datatype
		
		date:
			XXXX-XX-XX
			2016-10-18
		datatype:
			dx
			jcrz
			gkrz
			gzrz
EOF
	exit
fi

log_date="$1"
data_type="$2"
log_dir="/home/ulss/project/ulss-data-redistribution/log"
today=$(date +%Y-%m-%d)
if [ ${log_date} == ${today} ];then
	log_file="${log_dir}/ulss-data-redistribution.log"
else
        log_file="${log_dir}/ulss-data-redistribution.log.${log_date}"
fi
sum=`grep "just send" ${log_file} | grep ${data_type} | awk -F "just send" '{print $2}' | awk 'BEGIN{sum=0}{sum+=$1}END{print sum}'`
echo $sum
