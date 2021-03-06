#!/bin/sh

## Pre-install 
adduser nafis
adduser nafis wheel 
apk add doas  
echo "permit nopass :wheel" > /etc/doas.conf

cat > /etc/apk/repositories << EOF; $(echo)
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community
EOF

### πΏπΏ install πΏπΏ
apk update && apk upgrade 
apk add git 
apk add nginx 
apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-session php7-json
apk add mariadb mariadb-common mariadb-client 
apk add certbot certbot-nginx


##π§π§π§π§ Setup  

### nginx π¦π¦ 
adduser -D -g 'www' www -h /www
chown -R www:www /var/lib/nginx
mkdir /etc/nginx/sites
cp etc/nginx/nginx.conf /etc/nginx/nginx.conf
cp etc/nginx/site-avilable/cnn.local.conf /etc/nginx/sites/


## π²π² Mysql / Mariadb π»π»π»π»
/etc/init.d/mariadb setup
### -----------ποΈποΈποΈποΈποΈ  



## services πͺΆπͺΆπͺΆπͺΆπͺΆπͺΆπͺΆ
rc-update add nginx default
rc-update add php-fpm7 default
rc-update add mariadb default


## services - restart π¦π¦π¦π¦π¦π¦π¦π¦π¦
rc-service mariadb restart
rc-service nginx restart
rc-service php-fpm7 restart


## mariadb 
mysql_secure_installation

# cd /www/ 
# wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php 



## setup dami sites 
cp -r dami-site/cnn.local /www/


passwd -l root


