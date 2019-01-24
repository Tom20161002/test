#!/usr/bin/bash
#rm命令脚本，删除一个文件或者目录时，都要做备份，然后删除
fileName=$1
now=$(date +%Y%m%d%H%M)
read -p "Are you sure delete the file directory $1? yes|no: " input
if [ $input == "yes" ] || [ $input == "y" ]
then
  mkdir /date/.$now
  rsync -aR $1/ /data/.$now/$1/
  /bin/rm -rf $1
 elif [ $input == "no" ] || [ $input == "n" ] 
 then
   exit 0
  else
    echo "Only input yes or no"
    exit
   fi
