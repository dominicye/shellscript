#!编译好的jar包存放地址
file_path=/usr/src/app/live/target
#!将现有的jar备份后，将新的jar包替换
file="/home/app/live.jar"
if [ -f "$file" ]
then
mv /home/app/live.jar /home/app_backup/live.jar
mv /home/app_backup/live.jar /home/app_backup/live.jar.`date +%Y%m%d%H%M%S`
fi
cp "$file_path"/*.jar /home/app/
mv /home/app/*.jar /home/app/live.jar

