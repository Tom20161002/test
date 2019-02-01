#!/usr/bin/sh
#将目录下的后缀名改为txt文件，1.批改txt为txt.bak，2，吧bak打包，3.还原文件名，再把，bak的删除
File=$(find /backup/ -type f -name "*.txt" |xargs >/backup/txt.tt)
for i in $(cat /backup/txt.tt)
do 
  mv $i $i.bak
done
cd /backup/
tar czf 123.tar.gz ./*.bak
File_back=$(find /backup/ -type f -name "*.bak"|xargs >/backup/tar.tt)
for j in $(cat /backup/tar.tt)
do
  mv $j ${j%.*}
done
