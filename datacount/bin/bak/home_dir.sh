#!/bin/bash
#exec 1>$ $(pwd)/datacount.log
home_dir=$(cd .. ; pwd)
lib_dir="$home_dir/lib"
source $lib_dir/func_count.sh
#count intermediate_result_dir filedir
#intermediate_result_dir=$1 /usr/ncic/workdir/huizong/datacount/intermediate_result/917mt_special/20160719
#filedir=$2 /usr/ncic/workdir/huizong/917mt_special/20160719/upload_sucess



for day in $(seq 0 4)
do


	date_dir="$(date -d "${day} days ago" +%Y%m%d)"
	#echo $date_dir
	for table_name in $(cat ${lib_dir}/table_name)
	do
	#table_name=${lib_dir/table_name}




		huizong_dir="/usr/ncic/workdir/huizong"
		filedir="$huizong_dir/$table_name/$date_dir/upload_sucess"
		intermediate_result_dir="$home_dir/intermediate_result/$table_name/$date_dir"


		count $intermediate_result_dir $filedir
	done
done
