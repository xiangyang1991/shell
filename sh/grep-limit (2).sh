#!/bin/bash
echo $$
limit=$1
times=0
for i in `seq 1 1000`
	do
	let times=$times+1
	echo "times=$times"
	echo "the PID is $$"
	{
		sleep 5
		echo "PID=$$"

	} &
	while :
		do
		p=`ps -ef | grep -v sleep | grep -c $$`
		if [ "$limit" -lt "$p" ];then			
			p=`ps -ef | grep -c $$`
			echo "count=$p"
			sleep 2
		else
			echo "count=$p"
			break;	
		fi
	done
	sleep 0.005	
done
#wait
