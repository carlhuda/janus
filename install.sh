#!/bin/bash
#
# Install janus
#   From: https://github.com/misham/janus.git
#
# -----------------------------------------------------------------------------
# Only install janus if ruby is installed
#
type ruby 2>/dev/null 1>/dev/null
ruby_exists=$?
if [ "0" -eq "$ruby_exists" ]; then
# -----------------------------------------------------------------------------
# Setup .vim
#
if [[ -h $HOME/.vim ]]; then
  rm $HOME/.vim
elif [[ -e $HOME/.vim ]]; then
  echo ".vim/ exists, moving to $HOME/.vim.orig/"
  mv $HOME/.vim $HOME/.vim.orig
fi
ln -s $DOTFILES/janus $HOME/.vim
# -----------------------------------------------------------------------------
# Setup vimrc and gvimrc
#
if [[ -h $HOME/.vimrc ]]; then
  rm $HOME/.vimrc
elif [[ -e $HOME/.vimrc ]]; then
  echo "vimrc exists, moving to $HOME/.vimrc.orig"
  mv $HOME/.vimrc $HOME/.vimrc.orig
fi
if [[ -h $HOME/.gvimrc ]]; then
  rm $HOME/.gvimrc
elif [[ -e $HOME/.gvimrc ]]; then
  echo "vimrc exists, moving to $HOME/.vimrc.orig"
  mv $HOME/.gvimrc $HOME/.gvimrc.orig
fi
ln -s $HOME/.vim/vimrc $HOME/.vimrc
ln -s $HOME/.vim/gvimrc $HOME/.gvimrc
# -----------------------------------------------------------------------------
# Install plugins, etc.
#
cd $HOME/.vim && rake
#
fi
