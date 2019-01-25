#!/usr/bin/sh
#批量建立用户user_xx 并且所有用户tongshuyuusers组
group=$(cat /etc/group |grep -o users)
if [ $group == "users" ];then
  for i in $(seq 0 10)
  do
    if [ $i -lt 10 ];then
      useradd -g users user_0$i
     else
      useradd -g users user_$i
      fi
  done
 else
    echo "user group not found"
    exit 1
fi
