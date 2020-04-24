#!/bin/bash
# Program:
#     Use sed and awk to operate on a csv file.
# History:
# 2020/04/24	Antony	Second release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin

work="/home/antony/"
echo "Please copy the file to the $work directory" 

read -p "Please input old domain: " olddomain      # 提示输入旧域名
read -p "Please input new domain: " newdomain      # 提示输入新域名

olddomain=${olddomain}
newdomain=${newdomain}

#修改邮件地址中的域名
sed -i 's/'"${olddomain}"'/'"${newdomain}"'/'  $work"${olddomain}"-users.csv

#从第二行开始修改用户密码项为sa123456
sed -i '2,$s/,[^,]*,/,sa123456,/' $work"${olddomain}"-users.csv

#获取  邮箱地址,密码,真实姓名,移动电话,公司,部门,职务
awk  'BEGIN{FS=",";OFS="," }{print $1,$2,$3,$4,$5,$6,$7}' $work"${olddomain}"-users.csv > $work"${newdomain}".csv

#重命名文件名
mv $work"${olddomain}"-users.csv $work"${newdomain}"-users.csv

echo "Change ${olddomain} to ${newdomain}" 