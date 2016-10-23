#!/bin/bash
query(){
local res_dir=$1
local hz_file=$2
if [ -f ${hz_file} ];then
	rm -f ${hz_file}
fi
for i in $(cat ${res_dir}/* | awk '{print $1}' | sort | uniq)
do 
	local sum=$(cat ${res_dir}/* | grep $i | awk 'BEGIN{sum=0}{sum=sum+$2}END{print sum"\t"$3}')
	echo -e "$i\t$sum" >> ${hz_file}
done
}