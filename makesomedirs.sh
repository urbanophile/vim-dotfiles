#!/bin/sh

#########
# A simple script to make some directories
# later it will install vim stuff.
# Should be run after the makesymlink.sh script
# See http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide#intro for more details
##########

mkdir -p ~/dotfiles/vim/
mkdir ~/dotfiles/vim/{autoload,bundle}

