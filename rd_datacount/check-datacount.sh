. /etc/profile
. ~/.bash_profile

showUsage(){
	echo "check-datacount.sh serviceType timeStr dataType"
	echo "serviceType [dr|idx|se2dw|rd]"
}

if [ $# -lt 3 ]
then
	showUsage
	exit 0
fi

serviceType="$1"
timeStr="$2"
dataType="$3"
para=$4

if [ "$serviceType" == "dr" ];then
	./check-tools/check-dr-datacount.sh \"\""$timeStr"\"\" $dataType $para
elif [ "$serviceType" == "idx" ];then  
	./check-tools/check-idx-datacount.sh \"\""$timeStr"\"\" $dataType
elif [ "$serviceType" == "se2dw" ];then
	./check-tools/check-se2dw-datacount.sh \"\""$timeStr"\"\" $dataType
elif [ "$serviceType" == "rd" ];then
	./check-tools/check-rd-datacount.sh "$timeStr" $dataType 
else
	echo "unknown serviceType"
	showUsage
fi
