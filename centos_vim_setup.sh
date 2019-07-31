sudo yum install -y python36-devel python36-pip python-pip python-devel ncurses ncurses-devel cmake3
sudo ln -s /usr/bin/cmake3 /usr/bin/cmake

cat vimrc > ~/.vimrc

git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
--enable-multibyte \
--enable-pythoninterp=yes \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
--enable-python3interp=yes \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/

make -j4
sudo make install
make clean

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd ~/.vim/plugged/YouCompleteMe/
python3 ./install.py --clang-completer

## run gtags and ctags scripts
sh centos_ctags_gtags_setup.sh
