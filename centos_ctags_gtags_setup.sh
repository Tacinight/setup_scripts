sudo yum install -y python36-pip python-pip
sudo pip install --upgrade pip
sudo pip install pygments

wget http://tamacom.com/global/global-6.6.3.tar.gz
cd global-6.6.3
./configure
make -j4
sudo make install
make clean

git clone https://github.com/universal-ctags/ctags
cd ctags
./autogen.sh
./configure
make -j4
sudo make install
make clean
