#!/bin/bash

working_dir=`pwd`

echo "Installing bash_profile"
rm ~/.bash_profile
ln -s $working_dir/bash_profile ~/.bash_profile

echo "Installing bashrc"
rm ~/.bashrc
ln -s $working_dir/bashrc ~/.bashrc

echo "Installing BashPlugins"
rm ~/BashPlugins
ln -s $working_dir/BashPlugins ~/BashPlugins

echo "Installing vimrc"
rm ~/.vimrc
ln -s $working_dir/vimrc ~/.vimrc

echo "Installing vim"
rm ~/vim
ln -s $working_dir/vim ~/vim
