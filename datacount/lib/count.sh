#!/bin/bash






day=$1




count(){
dir="/usr/ncic/workdir/huizong/917mt"
todaydir=`date -d "$1 days ago" +%Y%m%d`
filedir="$dir/$todaydir/upload_sucess"
countdir="$dir/count/$todaydir"
mkdir -p $countdir
for source_file in `ls $filedir | grep -v ".ok"`
	do
	if [ ! -f "$countdir/$source_file" ]; then
		count_file="$countdir/$source_file"
		cat $filedir/$source_file | awk -F "\t" '{print $9}' | sort | grep -v "^$" | uniq -c > $count_file  
	fi		
done
}



count $day



#query(){
















#}
