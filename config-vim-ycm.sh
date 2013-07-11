#!/bin/sh

# https://github.com/Valloric/YouCompleteMe/
sudo apt-get install -y build-essential cmake python-dev clang libclang1

cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

# ycm conf
if [ ! -f ~/.ycm_extra_conf.py ]; then
  curl https://raw.github.com/Valloric/YouCompleteMe/master/cpp/ycm/.ycm_extra_conf.py -sLo ~/.ycm_extra_conf.py
fi
