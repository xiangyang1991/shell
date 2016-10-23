#!/bin/bash
#cd /usr/ncic/workdir/huizong/datacount/bin
#home_dir=$(cd .. ; pwd)
home_dir=$(cd `dirname $0`; cd ..; pwd)
lib_dir="$home_dir/lib"
source $lib_dir/func_query.sh

for table_name in $(cat ${lib_dir}/table_name)
do
	intermediate_result_dir="${home_dir}/intermediate_result/${table_name}/${date_dir}"
	res_dir="${home_dir}/result/${table_name}"	


	hz_file="${home_dir}/result/huizong/${table_name}"

	query $res_dir $hz_file
done
