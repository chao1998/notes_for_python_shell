#!/bin/bash

#---------------------------------
# Author:               WeiChao
# Date:                 2019/10/29      10:03:00
# Description:          用途用于删除七天前的dbproxy日志文件
# Version:              1.0
#---------------------------------

COMPRESS_LOGFILE_SUFFIX=`date +%Y-%m-%d`
SHELL_LOGFILE="/home/udal/LOG/Delete_${COMPRESS_LOGFILE_SUFFIX}.log"


function Delete_LOG() {
find /app/udal/dbproxy_*/logs/*.????-??-??.log -type f -mtime +15  >> ${SHELL_LOGFILE}
find /app/udal/dbproxy_*/logs/*.????-??-??.log -type f -mtime +15 -exec rm -f {} \;
if [ $? -eq 0 ];then
        echo "------ `date +%Y-%m-%d_%H:%M:%S` delete LOG, Success -------" >> ${SHELL_LOGFILE}
else
        echo "------ `date +%Y-%m-%d_%H:%M:%S` delete LOG, Failure -------" >> ${SHELL_LOGFILE}
fi

}

mkdir -p /home/udal/LOG
echo > ${SHELL_LOGFILE}
echo " -------------------Delete Logfile, `date +%Y-%m-%d_%H:%M:%S` Begin----------------------" >> ${SHELL_LOGFILE}
Delete_LOG
echo " -------------------Delete Logfile, `date +%Y-%m-%d_%H:%M:%S`  End-----------------------" >> ${SHELL_LOGFILE}





#!/bin/bash

#---------------------------------
# Author:               WeiChao
# Date:                 2019/10/29      10:03:00
# Description:          用途用于删除七天前的dbproxy日志文件
# Version:              1.0
#---------------------------------

COMPRESS_LOGFILE_SUFFIX=`date +%Y-%m-%d`
SHELL_LOGFILE="/home/udal/LOG/Delete_${COMPRESS_LOGFILE_SUFFIX}.log"


function Delete_LOG() {
find /app/udal/*_check*/*.log.????-??-?? -type f -mtime +15  >> ${SHELL_LOGFILE}
find /app/udal/*_check*/*.log.????-??-?? -type f -mtime +15 -exec rm -f {} \;
if [ $? -eq 0 ];then
        echo "------ `date +%Y-%m-%d_%H:%M:%S` delete LOG, Success -------" >> ${SHELL_LOGFILE}
else
        echo "------ `date +%Y-%m-%d_%H:%M:%S` delete LOG, Failure -------" >> ${SHELL_LOGFILE}
fi

}

mkdir -p /home/udal/LOG
echo > ${SHELL_LOGFILE}
echo " -------------------Delete Logfile, `date +%Y-%m-%d_%H:%M:%S` Begin----------------------" >> ${SHELL_LOGFILE}
Delete_LOG
echo " -------------------Delete Logfile, `date +%Y-%m-%d_%H:%M:%S`  End-----------------------" >> ${SHELL_LOGFILE}
