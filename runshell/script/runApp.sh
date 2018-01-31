#!/bin/bash
appProjectPath="/usr/src/app/live/"
appHomeDir="/home/app/"
appHomeLog="/home/app/log/"
appHomeBackup="/home/app_backup/"

if [ ! -d "$appHomeDir" ]; then
mkdir "$appHomeDir"
fi

if [ ! -d "$appHomeLog" ]; then
mkdir "$appHomeLog"
fi

if [ ! -d "$appHomeBackup" ]; then
mkdir "$appHomeBackup"
fi


echo "base app direcotry created"

if [ ! -d "$appProjectPath" ]; then
cd /usr/src/app
git clone git@39.108.135.118:ways/live.git
else
cd /usr/src/app/live
echo "pull latest file from git server"
git pull origin master
fi
 
echo "get latest code ending"

sh /home/script/stop.sh

cd $appProjectPath
mvn install
sh /home/script/replace.sh
nohup /home/script/startup.sh > /home/app/log/livelog.file 2>&1 &

