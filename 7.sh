#!/usr/bin/sh
#计算系统进程占用内容大小和，1.获取内存大小top ps  2.进行统计
Mem=$(ps aux|awk '{print $6}'|grep -v "RSS")
num=0
for i in $Mem
do
  num=$[($i+$num)]
done
  num=$[$num/1024]
  echo ${num}M
