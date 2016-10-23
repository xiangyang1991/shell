#!/bin/bash
sum(){
echo -e "$(date +%Y-%m-%d\ %H:%M:%S) Doing something, waiting..."
local intermediate_result_dir=$1
local result_file=$2
local table_name=$3
if [ -f $result_file ];then
	rm -f $result_file
fi
for i in `cat ${intermediate_result_dir}/* | awk '{print $2}' | sort | uniq -c | awk '{print $2}'` 
do
	sum=`cat ${intermediate_result_dir}/* | grep $i |  awk 'BEGIN{sum=0}{sum=sum+$1}END{print sum}'`
	echo -e "date_$i\t$sum\t$table_name" >> ${result_file}
done
}