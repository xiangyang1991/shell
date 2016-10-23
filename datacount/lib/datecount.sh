#!/bin/bash
dir="/usr/ncic/workdir/huizong/917mt/count/"
for i in `cat $dir/result/2016*  | awk '{print $1}' | sort | uniq`
	do 
	sum=`cat $dir/result/2016* | grep $i | awk 'BEGIN{sum=0}{sum=sum+$2}END{print sum}'`
	echo -e "$i\t$sum"
done
