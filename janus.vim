if empty($VIMFILES)
  source ~/.vim/vimrc
else
  if has('unix')
    set runtimepath=$VIMFILES,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vimcurrent,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,$VIMFILES/after
  endif
  source $VIMFILES/vimrc
endif

