#!/bin/bash
dir="/usr/ncic/workdir/huizong/917mt/count"
datedir=`date "-d $1 days ago" +%Y%m%d`
datacount(){
rm -rf $dir/result/$datedir
for i in `cat $1/*917MT* | awk '{print $2}' | sort | uniq -c | awk '{print $2}'` 
	do 
	sum=`cat $1/* | grep $i |  awk 'BEGIN{sum=0}{sum=sum+$1}END{print sum}'`
	echo -e "$i\t$sum" >> $dir/result/$datedir
done
}

datacount $dir/$datedir
