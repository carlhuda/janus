# Source RVM so vimius .rvmrc takes effect
if ! type rvm &> /dev/null; then
  [[ -s /usr/local/rvm/scripts/rvm ]] && source /usr/local/rvm/scripts/rvm
  [[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
fi

# Source Rbenv so vimius .rbenv-version takes effect
if ! type rbenv &> /dev/null; then
  if [[ -s $HOME/.rvm/scripts/rvm ]]; then
    eval "`$HOME/.rbenv/bin/rbenv init -`"
  fi
fi

# Add <strong>.old</strong> to any existing Vim file in the home directory
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do
  if [[ ( -e $i ) || ( -h $i ) ]]; then
    echo "${i} has been renamed to ${i}.old"
    mv "${i}" "${i}.old"
  fi
done

# Clone Vimius into .vim
git clone git://github.com/TechnoGate/vimius.git $HOME/.vim

# Run rake inside .vim
( cd $HOME/.vim && rake )
