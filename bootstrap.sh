# Source RVM so janus .rvmrc takes effect
[[ -s /usr/local/rvm/scripts/rvm ]] && source /usr/local/rvm/scripts/rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Source Rbenv so janus .rbenv-version takes effect
if ! type rbenv &> /dev/null; then
  if [[ -s $HOME/.rbenv/bin/rbenv ]]; then
    eval "`$HOME/.rbenv/bin/rbenv init -`"
  fi
fi

function die()
{
    echo "${@}"
    exit 1
}

# Add <strong>.old</strong> to any existing Vim file in the home directory
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do
  if [[ ( -e $i ) || ( -h $i ) ]]; then
    echo "${i} has been renamed to ${i}.old"
    mv "${i}" "${i}.old" || die "Could not move ${i} to ${i}.old"
  fi
done

# Clone Janus into .vim
git clone -b experimental git://github.com/carlhuda/janus.git $HOME/.vim \
  || die "Could not clone the repository to ${HOME}/.vim"

# Run rake inside .vim
cd $HOME/.vim || die "Could not go into the ${HOME}/.vim"
rake || die "Rake failed."
