# checks for updates
yum clean all
yum update

# CentOS GUI
yum -y groups install "GNOME Desktop"
echo "exec gnome-session" >> ~/.xinitrc
systemctl set-default graphical.target

# Stop Firewall
systemctl stop firewalld

# OR Disable Firewall
systemctl disable firewalld

# Adds Group Development Tools, PHP, Perl, Apache
yum -y groupinstall "Development tools" patch gcc httpd kernel-headers kernel-devel make perl wget php php-gd php-common php-soap php-mysql perl-libwww-perl.noarch perl-LWP-Protocol-https.noarch perl-GD perl-GDGraph net-tools perl-LWP-Protocol-https gd-devel pam-devel

# Start Apache
systemctl start httpd.service
systemctl enable httpd

# Enable SSH on boot
systemctl start sshd
systemctl enable sshd

# MySQL Setup
yum install mariadb-server mariadb
systemctl start mariadb
mysql_secure_installation
systemctl enable mariadb.service

# Reboot your system to start using the new kernel
reboot


# Install Webmin
nano /etc/yum.repos.d/webmin.repo
# Paste the following content into the file:
[Webmin]
name=Webmin Distribution Neutral
#baseurl=https://download.webmin.com/download/yum
mirrorlist=https://download.webmin.com/download/yum/mirrorlist
enabled=1
# Ctrl + X

# Install Virtualmin (Optional)
wget http://software.virtualmin.com/gpl/scripts/install.sh
chmod +x install.sh
./install.sh

#Install ConfigServer
cd /usr/src
rm -fv csf.tgz
wget https://download.configserver.com/csf.tgz
tar -xzf csf.tgz
cd csf
sh install.sh

# Install Virtualbox
wget http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo -P /etc/yum.repos.d
yum install VirtualBox-6.0

# Check if Virtualbox is running
systemctl status vboxdrv
useradd vboxweb
passwd vboxweb
usermod -a -G vboxusers vboxweb
cd /tmp/ && wget https://github.com/phpvirtualbox/phpvirtualbox/archive/master.zip
unzip master.zip -d /var/www/html/
cd /var/www/html/ && mv phpvirtualbox-master/ phpvirtualbox/
cd phpvirtualbox/
cp config.php-example config.php
nano config.php
# Change the username/password to the user that runs the VirtualBox web service.

var $username = 'vboxweb';
var $password = 'pass';

echo "VBOXWEB_USER=vboxweb" > /etc/default/virtualbox
systemctl restart vboxweb-service
yum install policycoreutils-python -y
semanage port -a -t http_port_t -p tcp 18083




