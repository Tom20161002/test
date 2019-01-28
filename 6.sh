#!/usr/bin/sh
#统计Nginx日志中每个IP的访问量有多少，、查询日志
awk '{print $1}' access.log |sort|uniq -c|sort -n|tail
awk '{print $1}' access.log |sort|uniq -c|sort -rn|head
