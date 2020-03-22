wget http://www.sec.gov/dera/data/Public-EDGAR-log-file-data/2017/Qtr2/log20170630.zip 
unzip $(find log*zip)
logfile=$(find log*csv)
chown $USER ./$logfile
chmod +x random_picker.sh 
sudo ./random_picker.sh
logfile=$(sudo find / -name $logfile 2>/dev/null)
cat $logfile | grep -i error > error_lines.csv
tail -500 $logfile > last500lines.csv
cat $logfile | grep 2017-06-30 | grep 14:00: | grep index.htm -c
cat $logfile | grep 2017-06-30 | grep -E "(18:00|17:[0-5][0-9]):" | grep index.htm -c
cat $logfile | grep -oE "([0-9]{1,3}\.){3}.{1,3}" | sort | uniq -c > ip
cat $logfile | grep 13.94.212.jdf -c





