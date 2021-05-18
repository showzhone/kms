#! /bin/bash

#One-key-kms script by Dakkidaze <gioku@docomo.net.cn>

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
clear

start(){
mkdir /usr/local/kms
cd /usr/local/kms
git clone https://github.com/Wind4/vlmcsd.git
cd vlmcsd
make
cd bin
mv vlmcsd /usr/local/kms/kms
cd /usr/local/kms/
rm -rf ./vlmcsd/
mv kms vlmcsd
clear
echo "Succeeded."
echo "The executable file lies in /usr/local/kms/"
echo "Remember that the server is not running right now."
echo "Please use -h to find possible usage for the executable or visit vlmcsd on Github."
}

if [ -f /etc/redhat-release ]; then
  yum install gcc git make -y
  start
fi

if [ -f /etc/lsb-release ]; then
  apt-get install gcc git make -y
  start
fi


read -p "y/n:" choice
case $choice in
	"y")
	start
	;;
	"n")
	exit 0;
	;;
	*)
	echo "Please enter y or n!"
	;;
esac