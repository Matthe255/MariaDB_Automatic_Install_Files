apt update && apt upgrade -y

sleep 1

apt install ca-certificates apt-transport-https lsb-release gnupg curl nano unzip -y
wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
apt install apache2 -y
sleep 1
apt install php7.4 php7.4-cli php7.4-common php7.4-curl php7.4-gd php7.4-intl php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-xml php7.4-xsl php7.4-zip php7.4-bz2 libapache2-mod-php7.4 -y
apt install mariadb-server mariadb-client -y
sleep 1
echo "Done installing, now we have do configure the sql Database system."
sleep 5
mysql_secure_installation
sleep 1
cd /usr/share
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip -O phpmyadmin.zip && unzip phpmyadmin.zip
sleep 2
rm phpmyadmin.zip
mv phpMyAdmin-*-all-languages phpmyadmin && chmod -R 0755 phpmyadmin
cd /etc/apache2/conf-available/
#Download the Apache config
wget https:// -O phpmyadmin.conf






sleep 2
a2enconf phpmyadmin
sleep .5
systemctl reload apache2
mkdir /usr/share/phpmyadmin/tmp/
chown -R www-data:www-data /usr/share/phpmyadmin/tmp/



