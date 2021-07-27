**Server Deploy Project - centmin mod**

After deploy cloud server use provide console to change sshd

sudo vi /etc/ssh/sshd_config

change this line to yes

PasswordAuthentication yes

and this line also

PermitRootLogin yes

save and quit :wq 

next we will create password for root then grant permission

sudo su

then set password for root

passwd

save and quit :wq 
dont forget to set hostname to pass FQDN qualify 

sudo vi /etc/hosts

find line that have ip and hostname set

1.2.3.4 hostname.domainname.com hostname 

save and quit :wq and then

reboot

now from ssh client ip

ssh root@123.123.123.123

install first scripts to prepare update kernel

curl -LJO https://raw.githubusercontent.com/iDaemo/cminstall/master/kernel5.sh && bash kernel5.sh

it will reboot ssh to longin again to check kernel that already run

uname -a

then time to centmin mod 

curl -LJO https://raw.githubusercontent.com/iDaemo/cminstall/master/cminstall.sh && bash cminstall.sh


dont forget to enable cache control time in /usr/local/nginx/conf/wpincludes/domain.com/cachenebler.domain.com



### amplify step 2
our conf file at /usr/local/nginx/conf/conf.d/







