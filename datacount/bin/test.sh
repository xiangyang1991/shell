basepath=$(cd `dirname $0`; pwd)
echo $basepath

echo $(basename $0)
echo $(dirname $0)
echo $0
home_dir=$(cd `dirname $0`; cd ..; pwd)
echo $home_dir
echo $(basename $0)
echo $0
