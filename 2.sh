#!/usr/bin/sh
fileName=$1
now=$(date +%Y%m%d%H%M)
f_size=$(du -sk $1 |awk '{print $1}')
disk_size=$( LANG=en; df -k |grep -vi filesystem  |sort -n -k4 |tail -n1 |awk '{print $4}')
big_filesystem=$(LANG=en; df -k |grep -vi filesystem |sort -n -k4 |tail -n1|awk '{print $NF}')
if [ $f_size -lt $disk_size ];then
read -p "Are you sure  delete the file or directory: "$1"? yes|no:" input
 if [ $input == "yes" ];then
  mkdir -p $big_filesystem/.$now && rsync -a $1 $big_filesystem/.$now/ 
  elif [ $input == "no" ];then
  exit 0
  else
    echo "Only input 'yes' or 'no' "
  fi
 else
  echo "This disk size is not enough to backup the file : $1 "
  read -p "Do you want to delete "$1"? yes|no:" input
  if [ $input == "yes" ];then
    echo "it will delete "$1" after 5 seconds whitout backup "
    for i in $(seq 1 5); do echo -ne "."; sleep 1;done
    echo "---rm---"
   elif [ $input == "no" ];then
    echo "it will not delete $1."
    exit 0
   else
    echo "Only input 'yes'or'no'."
  fi
fi
