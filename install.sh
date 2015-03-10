#!/bin/bash

rm ~/.bashrc
rm ~/.vimrc
rm ~/.tmux.conf
rm ~/.pythonstartup
rm ~/opt

ln -s ~/git/dotfiles/bashrc ~/.bashrc
ln -s ~/git/dotfiles/vimrc ~/.vimrc
ln -s ~/git/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/git/dotfiles/opt ~/opt
ln -s ~/git/dotfiles/vim ~/.vim
ln -s ~/git/dotfiles/pythonstartup ~/.pythonstartup

mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd
git clone https://github.com/nojhan/liquidprompt.git

# wmctrl for fullscreen gvim
sudo apt-get install wmctrl
