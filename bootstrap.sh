#!/bin/bash

function die()
{
    echo "${@}"
    exit 1
}

function backup_previous_install()
{
  # Add .old to any existing Vim file in the home directory
  for filepath in "${HOME}/.vim" "${HOME}/.vimrc" "${HOME}/.gvimrc"; do
    if [ -e $filepath ]; then
      mv "${filepath}" "${filepath}.old" || die "Could not move ${filepath} to ${filepath}.old"
      echo "${filepath} has been renamed to ${filepath}.old"
    fi
  done
}

function clone_janus()
{
  # Clone Janus into .vim
  git clone --recursive https://github.com/carlhuda/janus.git "${HOME}/.vim" \
    || die "Could not clone the repository to ${HOME}/.vim"
}

function run_rake()
{
  # Run rake inside .vim
  pushd "${HOME}/.vim" || die "Could not go into the ${HOME}/.vim"
  rake || die "Rake failed."
  popd
}

function main()
{
  if [ ! -e "${HOME}/.vim/janus" -o "$1" == "--force" ]; then
    backup_previous_install
    clone_janus
  fi
  run_rake
}

main $1
