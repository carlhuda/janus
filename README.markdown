# Jan: A smaller janus 

This is a basic distribution of vim plugins and tools intended to be run
on top vim/ gvim

I ram9 - make this smaller - so that it is not so crufty and the beauty of
the simple deploy may find it's way into the universal light of bla bla blah.

It may get smaller

## Installation

0. `for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old;
   done`
1. `git clone git://github.com/robotarmy/jan.git ~/.vim`
2. `cd ~/.vim`
3. `rake`

or

  `curl https://github.com/robotarmy/jan/raw/master/bootstrap.sh -o - | sh`

## Updating to the latest version

To update to the latest version of the distribution, just run `rake`
again inside your `~/.vim` directory.

# Intro to VIM

Here's some tips if you've never used VIM before:

## Tutorial

* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.

## Modes

* VIM has two modes:
  * insert mode- stuff you type is added to the buffer
  * normal mode- keys you hit are interpretted as commands
* To enter insert mode, hit `i`
* To exit insert mode, hit `<ESC>`

## Useful commands

* Use `:q` to exit vim
* Certain commands are prefixed with a `<Leader>` key, which maps to `\`
  by default. Use `let mapleader = ","` to change this.

# Features

Read the Source