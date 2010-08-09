# Janus: Carlhuda's vim Distribution

This is a basic distribution of vim plugins and tools intended to be run on top of the latest MacVIM snapshot.

We (Carl and Yehuda) both use this distribution for their own use, and welcome patches and contributions to help make it
an effective way to get started with vim and then use it productively for years to come.

At present, we are still learning to use vim ourselves, so you should anticipate a period of rapid development while
we get a handle on the best tools for the job. So far, we have mostly integrated existing plugins and tools, and we
anticipate to continue doing so while also writing our own plugins as appropriate.

In general, you can expect that the tools we use work well together and that we have given careful thought to the
experience of using MacVIM with the tools in question. If you run into an issue using it, please report an issue
to the issue tracker.

## Installation

1. `git clone git@github.com:carlhuda/vimrc.git ~/.vimrc`
2. `cd ~/.vimrc`
3. `rake`

## Updating to the latest version

To update to the latest version of the distribution, just run `rake` again inside your `~/.vim` directory.

# Features

This vim distribution includes a number of packages built by others.

## NERDTree

NERDTree is a file explorer plugin that provides "project drawer" functionality to your vim projects. 
You can learn more about it with :help NERDTree.

**Customizations**: Janus adds a number of customizations to the core NERDTree:

* Ignore `*.rbc` and `*~` files
* Automatically activate NERDTree when MacVIM opens and make the original buffer the active one
* Provide alternative :e, :cd, :rm and :touch abbreviations which also refresh NERDTree when done
  (when NERDTree is open)

## Ack.vim

Ack.vim uses ack to search inside the current directory for a pattern. You can learn more about it with
:help Ack

**Customizations**: Janus rebinds command-shift-f (<D-F>) to bring up `:Ack `.

## Command-T

Command-T provides a mechanism for searching for a file inside the current working directory. It
behaves similarly to command-t in Textmate.

**Customizations**: Janus rebinds command-t (<D-t>) to bring up this plugin. It defaults to
<Leader>t.

## indent\_object

Indent object creates a "text object" that is relative to the current ident. Text objects work
inside of visual mode, and with `c` (change), `d` (delete) and `y` (yank). For instance, try
going into a method in normal mode, and type `v ii`. Then repeat `ii`.

**TO BE CONTINUED**
