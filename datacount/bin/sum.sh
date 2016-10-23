#!/bin/bash
#脚本默认的目录为~
#当一个脚本用计划任务自动执行时，该脚本的默认目录是当前用户的~
exec 1>> /usr/ncic/workdir/huizong/datacount/bin/log
exec 2>> /usr/ncic/workdir/huizong/datacount/bin/err.log
echo -e "\n"
echo "$(date +%Y-%m-%d\ %H:%M:%S) start $(basename $0)"
#cd /usr/ncic/workdir/huizong/datacount/bin
#home_dir=$(cd .. ; pwd)
home_dir=$(cd `dirname $0`; cd ..; pwd)
lib_dir="$home_dir/lib"
source $lib_dir/func_count.sh
source $lib_dir/func_sum.sh
#count intermediate_result_dir filedir
#intermediate_result_dir=$1 /usr/ncic/workdir/huizong/datacount/intermediate_result/917mt_special/20160719
#filedir=$2 /usr/ncic/workdir/huizong/917mt_special/20160719/upload_sucess
for day in $(seq 0 4)
do
	date_dir="$(date -d "${day} days ago" +%Y%m%d)"
	for table_name in $(cat ${lib_dir}/table_name)
	do
		#table_name=${lib_dir/table_name}
		huizong_dir="/usr/ncic/workdir/huizong"
		filedir="$huizong_dir/$table_name/$date_dir/upload_sucess"
		intermediate_result_dir="${home_dir}/intermediate_result/${table_name}/${date_dir}"
		result_file="${home_dir}/result/${table_name}/${date_dir}"	
		if [ ! -d $filedir ];then
			echo "$(date +%Y-%m-%d\ %H:%M:%S) $filedir not created, will do the count_process next time"
			continue
		fi
		src_file_num=$(ls ${filedir} | grep -v ".ok" | wc -l)

		if [ ! -d ${intermediate_result_dir} ];then
			echo "$(date +%Y-%m-%d\ %H:%M:%S) $table_name首次统计结果，新增文件数：$src_file_num"
			count $intermediate_result_dir $filedir
			sum $intermediate_result_dir $result_file $table_name
		elif : ;then 
			int_file_num=$(ls ${intermediate_result_dir} | wc -l)
			diff=$((src_file_num-int_file_num))
			if [ $src_file_num -ne $int_file_num ];then
				echo "$(date +%Y-%m-%d\ %H:%M:%S) $table_name 新增文件数：$diff，重新统计结果"
				count $intermediate_result_dir $filedir
				sum $intermediate_result_dir $result_file $table_name
			elif : ;then
				echo "$(date +%Y-%m-%d\ %H:%M:%S) 文件数量未发生变化的目录：$table_name/$date_dir"
			fi
		fi
	done
done
