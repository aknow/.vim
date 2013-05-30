#!/bin/sh

# vim YouCompleteMe
# https://github.com/Valloric/YouCompleteMe/
sudo apt-get install build-essential cmake python-dev clang libclang1
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

cd ~
wget https://raw.github.com/Valloric/YouCompleteMe/master/cpp/ycm/.ycm_extra_conf.py
