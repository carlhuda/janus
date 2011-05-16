for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old; done
echo "*  Attempting to clone with SSH."
if ! git clone git://github.com/carlhuda/janus.git ~/.vim ; then
  echo "*  SSH doesn't work; are you behind a firewall? Let's try HTTPS."
  if git clone https://github.com/carlhuda/janus.git ~/.vim ; then
    echo "*  HTTPS works. We'll use that to install the rest."
    export GIT_HTTPS_ONLY=true
  else
    fail "*  Unable to clone the janus repository, attempted both git:// and https://"
  fi
fi
cd ~/.vim
rake
unset GIT_HTTPS_ONLY
