#!/bin/sh

## 
adduser nafis
adduser nafis wheel 
apk add doas  
echo "permit nopass :wheel" > /etc/doas.conf


### 🌿🌿 install 🌿🌿
apk update
apk add git 
apk add nginx 
apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl
apk add mariadb mariadb-common mariadb-client 


##🐧🐧🐧🐧 Setup  

### nginx 🐦🐦 
adduser -D -g 'www' www -h /www
chown -R www:www /var/lib/nginx
cp etc/nginx.conf /etc/nginx/nginx.conf

## 🌲🌲 Mysql / Mariadb 🌻🌻🌻🌻
/etc/init.d/mariadb setup
### -----------🕊️🕊️🕊️🕊️🕊️  



## services 🪶🪶🪶🪶🪶🪶🪶
rc-update add nginx default
rc-update add php-fpm7 default
rc-update add mariadb default


## services - restart 🦖🦖🦖🦖🦖🦖🦖🦖🦖
rc-service mariadb restart
rc-service nginx restart
rc-service php-fpm7 restart


## mariadb 
mysql_secure_installation

# cd /www/ 
# wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php 


passwd -l root