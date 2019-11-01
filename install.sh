# Adds RPG & EPEL Repositories
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
,,,,,,,,,,,,,,,,,,,working here


# checks for updates
yum clean all
yum update

# Adds Group Development Tools and Other 
yum install aspell-devel bison byacc bzip2-devel cscope ctags cvs diffstat doxygen flex httpd-devel ImageMagick freetype-devel gcc gcc-c++ gcc-gfortran gettext git gzip gmp-devel indent intltool libcurl-devel libtool libxml2-devel libicu-devel libjpeg-devel libpng-devel libtidy-devel libvpx-devel libXpm-devel libxslt-devel mysql mysql-devel mysql-server openssl-devel patch patchutils perl-GDGraph proftpd readline-devel t1lib-devel perl perl-GDGraph php php-dom php-gd php-mbstring php-mysql php-pdo php-imap php-ldap php-mcrypt rcs redhat-rpm-config rpm-build subversion swig systemtap

# checks for updates
yum clean all
yum update

# MySQL Setup
chkconfig mysqld on
chkconfig httpd on
/etc/init.d/httpd start
/etc/init.d/httpd restart
service iptables restart

# Install Webmin
wget http://prdownloads.sourceforge.net/webadmin/webmin-1.791-1.noarch.rpm
rpm -U webmin-1.791-1.noarch.rpm

# Install Virtualmin
wget http://software.virtualmin.com/gpl/scripts/install.sh
chmod +x install.sh
./install.sh

#Install ConfigServer
wget http://www.configserver.com/free/csf.tgz
tar -xzf csf.tgz
cd csf
sh install.sh
# Install the csf webmin module in:
# Webmin > Webmin Configuration > Webmin Modules >
# From local file > /usr/local/csf/csfwebmin.tgz > Install Module
