#!/bin/bash

rm ~/.bashrc
rm ~/.vimrc

ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

ln -s ~/dotfiles/opt ~/opt

mkdir ~/.vim
mkdir ~/.vim/colors

cp ~/dotfiles/molokai.vim ~/.vim/colors
cp ~/dotfiles/candycode.vim ~/.vim/colors

mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
