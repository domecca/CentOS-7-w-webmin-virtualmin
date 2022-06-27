# checks for updates
yum clean all
yum update

# Install Apache
yum install httpd

# Start Apache
systemctl start httpd.service

# Stop Firewall
systemctl stop firewalld

# OR Disable Firewall
systemctl disable firewalld

# Adds Group Development Tools
yum groupinstall "Development tools"

# Enable SSH on boot
systemctl start sshd

# MySQL Setup
yum install mariadb-server mariadb
systemctl start mariadb
mysql_secure_installation
systemctl enable mariadb.service

# Install PHP
yum install php php-mysql
systemctl restart httpd.service

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

# Install Perl
yum install perl
yum install perl-libwww-perl.noarch perl-LWP-Protocol-https.noarch perl-GD perl-GDGraph net-tools perl-LWP-Protocol-https gd-devel pam-devel

#Install ConfigServer
cd /usr/src
rm -fv csf.tgz
wget https://download.configserver.com/csf.tgz
tar -xzf csf.tgz
cd csf
sh install.sh


