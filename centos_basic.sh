sudo yum install -y http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm

sudo yum rease git
sudo yum install -y git2u centos-release-scl devtoolset-8 autoconf automake
# Not working for zsh
# source scl_source enable devtoolset-8
source /opt/rh/devtoolset-8/enable
