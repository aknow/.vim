#!/bin/sh

cd
if [ ! -d ./.vim/ ]; then
  git clone https://github.com/aknow/.vim.git
fi

ln -sb .vim/.vimrc .
ln -sb .vim/.gvimrc .

# vundle install
vim +BundleInstall +BundelUpdate +qall

# html, xhtml syntax
if [ -d ~/.vim/bundle/xmledit/ftplugin/ ]; then
  cd ~/.vim/bundle/xmledit/ftplugin/
  ln -sb xml.vim html.vim
  ln -sb xml.vim xhtml.vim
fi

# ycm
cd ~/.vim
./config-vim-ycm.sh
