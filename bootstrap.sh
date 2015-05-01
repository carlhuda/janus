#!/bin/bash

function die()
{
    echo "${@}"
    exit 1
}

# Add .old to any existing Vim file in the home directory
for filepath in "${HOME}/.vim" "${HOME}/.vimrc" "${HOME}/.gvimrc"; do
  if [ -e $filepath ]; then
    mv "${filepath}" "${filepath}.old" || die "Could not move ${filepath} to ${filepath}.old"
    echo "${filepath} has been renamed to ${filepath}.old"
  fi
done

# Clone Janus into .vim
git clone https://github.com/carlhuda/janus.git "${HOME}/.vim" \
  || die "Could not clone the repository to ${HOME}/.vim"

# Run rake inside .vim
cd "${HOME}/.vim" || die "Could not go into the ${HOME}/.vim"
rake || die "Rake failed."
