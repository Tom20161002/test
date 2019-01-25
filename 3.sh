#!/usr/bin/sh
cd /root/
list=(`ls`)

for i in ${list[@]}
do
  if [ -d $i ];then
    cp -r $i /tmp/
  fi
done
