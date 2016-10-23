#!/bin/bash
count(){
local filedir=$2
local intermediate_result_dir=$1
if [ ! -d "$intermediate_result_dir" ]; then
	echo "`date`: $intermediate_result_dir not exist will mkdir $intermediate_result_dir"
	mkdir -p $intermediate_result_dir
fi

for source_file in `ls $filedir | grep -v ".ok"`
	do
	if [ ! -f "$intermediate_result_dir/$source_file" ]; then
		echo -e "$(date +%Y-%m-%d\ %H:%M:%S) Add ${source_file}'s result to $intermediate_result_dir"
		count_file="$intermediate_result_dir/$source_file"
		cat $filedir/$source_file | awk -F "\t" '{print $9}' | sort | grep -v "^$" | uniq -c > $count_file  
	fi		
done
}