/app/teledb/mysql/bin/mysqldump -h10.152.0.23 -P9014 -ubackup -pbak123 --set-gtid-purged=OFF --databases mysql ctglb_admin teledb > /app/teledb/teledb`date +"%Y%m%d"`.dump
/app/teledb/mysql/bin/mysqldump -h10.152.0.19 -P10001 -ubackup -pbak123 --all-databases  > /app/teledb/udaldb`date +"%Y%m%d"`.dump
/app/teledb/mysql/bin/mysqldump -h10.152.0.40 -P18801 -ubackup -pbak123 --set-gtid-purged=OFF --all-databases  > /app/teledb/otterdb`date +"%Y%m%d"`.dump
find /app/teledb/*.dump -mtime +7 -exec rm {} \;




#!/bin/bash

dbzkdir=/home/ctgcloud/udal_zk_1_10014/zookeeper-3.4.12/bin
mysqlzkdir=/app/teledb/zookeeper_9300/zookeeper-3.4.10/bin
cachezkdir=/home/ctgcloud/ctg-cache-autodeploy/Software/zookeeper-3.5.1-alpha/bin
mqzkdir=/home/ctgcloud/mq_zk_1_9303/zookeeper-3.5.1-alpha/bin
password="Bss189#@!"

echo "start"
for((t=1;t<=4;t++));
	do{
		for i in {19..23};
		do
		/usr/bin/expect << EOF					
		spawn ssh ctgcloud@10.152.0.$i -p1433			
		while 1 {
					expect {
							"password:" { send "${password}\n" }
							eof { exit }
					}
				}
EOF

##存在问题：成功通过ssh到远程主机后无法继续执行接下来的命令

cd ${dbzkdir}
./zkCli.sh -server 10.152.0.$i:10014
ls /
quit
done
}
done

