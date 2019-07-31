if [ -n "$(command -v apt)" ]
then 
	apt install python3-dev python-dev libncurses5-dev cmake
else
	yum install python3-dev python-dev libncurses5-dev cmake
fi  

cat vimrc > ~/.vimrc
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
--enable-multibyte \
--enable-pythoninterp=yes \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
--enable-python3interp=yes \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/
make -j4; make install

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd ~/.vim/plugged/YouCompleteMe/; python3 ./install.py --clang-completer
