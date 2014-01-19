#!/bin/sh

ln -sf ~/dotfiles/_gvimrc ~/.gvimrc
ln -sf ~/dotfiles/_vimrc ~/.vimrc
ln -sf ~/dotfiles/_jshintrc ~/.jshintrc
ln -sf ~/dotfiles/_zshrc ~/.zshrc
ln -sf ~/dotfiles/_vim ~/.vim
mkdir ~/.bundle

echo ""
echo "##############################"
echo "#    Setup has completed.    #"
echo "##############################"
echo ""
echo "Plaese install neobundle and vimproc."
echo "You input following commands and it will work out well."
echo ""
echo "Commands:"
echo "   $ cd ~/.bundle"
echo "   $ git clone git://github.com/Shougo/neobundle.vim.git" 
echo ""
