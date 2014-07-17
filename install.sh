#!/bin/bash

rm ~/.bashrc
rm ~/.vimrc
rm ~/.tmux.conf
rm ~/opt

ln -s ~/git/dotfiles/bashrc ~/.bashrc
ln -s ~/git/dotfiles/vimrc ~/.vimrc
ln -s ~/git/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/git/dotfiles/opt ~/opt

rm -rf ~/.vim
mkdir ~/.vim
mkdir ~/.vim/colors

cp molokai.vim ~/.vim/colors
cp candycode.vim ~/.vim/colors

mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd
git clone https://github.com/nojhan/liquidprompt.git
