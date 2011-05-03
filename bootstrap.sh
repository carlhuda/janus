for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done
git clone git://github.com/just3ws/janus.git ~/.vim
cd ~/.vim
rake
