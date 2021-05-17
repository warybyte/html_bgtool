#!/bin/bash
# ------------------------------------------------------------
# Author: @warybyte
# Background image HTML generator...because Conky is clunky...
# -------------------------------------------------------------
# 
# BUILD HTML FILE
outfile=/<PATH>/<TO>/<HTML>/bg.html;
HTML0="<html>
<head>
<style>
div.bgtool {
position: absolute;
top: 5px;
right: 5px;
width: 300px;
height: 895px;
background-color: #2E3436;
opacity: 0.6;
border: 5px solid #2E3436;
border-radius: 5px;
}
</style>
</head>
<body style=\"background-image: url('/<PATH/<TO>/<YOUR>/Pictures/coolpic3.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;\">
<div class=\"bgtool\">
<pre>
<code style=\"color: #FFFFFF; opacity: 1.0;\">
";
HTML1="
</code>
</pre>
</div>
</body>
</html>
";
# DEFINE CONTENT
NAMESET=" <b>Name:</b> $(uname -n)";
MEMHEAD=$(free -h | sed s/total/"RAM total"/g | awk -F ' ' '{print $1" "$2" "$3}' | head -1);
MEMTOT=$(free -h | tail -2 | head -1 | awk -F ' ' '{print $1" "$2" "$3}');
MEMSWAP=$(free -h | tail -1 | awk -F ' ' '{print $1" "$2" "$3}');
IPSET=" <b>IP:</b> $(ip address show label enp4s6 | grep inet | awk -F ' ' '{print $2}' | head -1 | awk -F '/' '{print $1}')";
NTPSET=" <b>NTP:</b> $(ntpstat | awk -F ' ' '{print $1}' | head -1)";
DISKSET="<b>Storage:</b> / $(df -h / | tail -1 | awk -F ' ' '{print $5}')";
WEBSTAT="<b>HTTPD:</b> $(systemctl status apache2 | grep Active | awk -F ' ' '{print $2" "$3}')";
SSHSTAT="<b>SSHD:</b> $(systemctl status sshd | grep Active | awk -F ' ' '{print $2" "$3}')";
LDAPSTAT="<b>LDAP:</b> $(systemctl status slapd | grep Active | awk -F ' ' '{print $2" "$3}')";
FLASKSTAT1="<b>App1:</b> $(ps -elf | grep "8090" | grep -v grep | awk -F ' ' '{print $18}' | sed s/--//g)";
FLASKSTAT2="<b>App2:</b> $(ps -elf | grep "8091" | grep -v grep | awk -F ' ' '{print $18}' | sed s/--//g)";
RXSTAT="<b>RX Packets:</b> $(ip -s link show dev enp4s6 | grep -A1 "RX\|TX" | grep -v "RX\|TX" | head -1 | awk -F ' ' '{print $2}')";
TXSTAT="<b>TX Packets:</b> $(ip -s link show dev enp4s6 | grep -A1 "RX\|TX" | grep -v "RX\|TX" | tail -1 | awk -F ' ' '{print $2}')";
DATESET=$(date);
# TEST
rm $outfile;
echo $HTML0 >> $outfile;
echo $DATESET >> $outfile;
echo "- - - - - - - - - - - - - - - - - - -">> $outfile;
echo $NAMESET >> $outfile;
echo "- - - - - - - - - - - - - - - - - - -">> $outfile;
echo $DISKSET >> $outfile;
echo $MEMHEAD >> $outfile;
echo $MEMTOT >> $outfile;
echo $MEMSWAP >> $outfile;
echo "- - - - - - - - - - - - - - - - - - -">> $outfile;
echo $IPSET >> $outfile;
echo $NTPSET >> $outfile;
echo $RXSTAT >> $outfile;
echo $TXSTAT >> $outfile;
echo "- - - - - - - - - - - - - - - - - - -">> $outfile;
echo $WEBSTAT >> $outfile;
echo $SSHSTAT >> $outfile;
echo $LDAPSTAT >> $outfile;
echo $FLASKSTAT1 >> $outfile;
echo $FLASKSTAT2 >> $outfile;
echo "- - - - - - - - - - - - - - - - - - -">> $outfile;
echo $HTML1 >> $outfile;
sleep 3;
# CONVERT PAGE FROM HTML TO IMAGE
/<PATH>/<TO>/bgmkr.py
