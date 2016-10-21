#!/bin/bash
limit=$1
for i in `seq 1 100`
	do	
	{
	sleep 60
	echo "hello world"
	} &
	p=`ps -ef | grep -c $$`
#	if [ $p -gt $limit ];then
#		sleep 30
#	fi

	while [ $p -gt $limit ]
		do	
		p=`ps -ef | grep -c $$`
		sleep 30
	done
		
	

done
