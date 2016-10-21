#!/bin/bash

limit=10
select(){
	local uid=$1
	echo "select * from mb_ql and uid=$uid" > sql.sql
	qtest -q sql.sql -c wb -o ${uid}.file
}
for i in $(cat uid.file); do
	{
		select $i
	} &
	num_proc=$(ps -ef | grep $$ | wc -l)
	while (true); do
		if [ $num_proc -gt $limit ]; then
			sleep 1
		else
			break
		fi
	done
done