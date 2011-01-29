for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done
#git clone git://github.com/carlhuda/janus.git ~/.vim
git clone git://github.com/larssmit/janus.git ~/.vim
cd ~/.vim
rake
