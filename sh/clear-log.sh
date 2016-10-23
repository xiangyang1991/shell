. /etc/profile
. ~/.bash_profile

cd ~/tools
mkdir -p log
clearLog(){
	dir=~/project/$1/log
	if [ -d $dir ]
	then
		echo $dir
		find $dir  -ctime +10 |xargs rm -vf >> ./log/rm-log`date +%Y%m%d`.log
	fi
}
clearLog ulss-data-dispatcher
clearLog ulss-data-redistribution
clearLog ulss-data-match-plugin
clearLog ulss-data-indexer
clearLog ulss-data-se2dw