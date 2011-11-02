# Janus: Carlhuda's vim Distribution

This is a basic distribution of vim plugins and tools intended to be run
on top of the latest MacVIM snapshot.

We (Carl and Yehuda) both use this distribution for our own use, and
welcome patches and contributions to help make it an effective way to
get started with vim and then use it productively for years to come.

At present, we are still learning to use vim ourselves, so you should
anticipate a period of rapid development while we get a handle on the
best tools for the job. So far, we have mostly integrated existing
plugins and tools, and we anticipate to continue doing so while also
writing our own plugins as appropriate.

In general, you can expect that the tools we use work well together and
that we have given careful thought to the experience of using MacVIM
with the tools in question. If you run into an issue using it, please
report an issue to the issue tracker.

## Pre-requisites

Janus is built primarily for [MacVim](http://code.google.com/p/macvim/) on OSX.
Download it [here](https://github.com/b4winckler/macvim/downloads).

Alternatively, you can use Janus with the bundled console `vim` installation on
OSX (via Terminal), or with any other `vim` or `gvim` installation.

Linux users can install `gvim` for an experience identical to MacVim.
On Debian/Ubuntu, simply `apt-get install vim-gnome`. For remote
servers, install console vim with `apt-get install vim-nox`.

On a fresh Ubuntu install you also have to install the packages `rake` and `ruby-dev`
before running the install script and `exuberant-ctags` for ctags
support.

## Installation

0. `for i in ~/.vim ~/.vimrc ~/.gvimrc; do [ -e $i ] && mv $i $i.old;
   done`
1. `git clone git://github.com/TechnoGate/janus.git ~/.vim`
2. `cd ~/.vim`
4. `rake`

or

  `curl https://raw.github.com/TechnoGate/janus/master/bootstrap.sh -o - | sh`

## Customization

You can use `~/.gvimrc.before` and `~/.vimrc.before` for settings Janus,
like the __leader__ setting, you may also use `~/.gvimrc.after` and
`~/.vimrc.after` for any additonal setting, it is also a good place for
overriding Janus settings as both files will be loaded at the end of
Janus

For example, to override the default color schemes:

    echo color desert  >> ~/.vimrc.after
    echo color molokai >> ~/.gvimrc.after

If you want to add additional Vim plugins you can do so by adding a new
submodule in the Janus repository like so:

```bash
$ cd ~/.vim
$ git submodule add git://github.com/vim-scripts/Rename2.git janus-tools/rename2
```

If you want to disable one of the modules, add the folder name of the
plugin without the janus-* group (nerdcommenter for example) to
g:pathogen_disabled in your `~/.vimrc.before` file

    echo "let g:pathogen_disabled = ['nerdcommenter']" >> ~/.vimrc.before

Plugins hosted at [vim.org](http://www.vim.org/scripts) use a
unique URL for each version, You can use the GitHub mirror at
[https://github.com/vim-scripts](https://github.com/vim-scripts) to get
an url for any ViM script.

## Updating to the latest version

To update to the latest version of the distribution, just run `rake`
again inside your `~/.vim` directory.

# Intro to VIM

Here's some tips if you've never used VIM before:

## Tutorials

* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.
* Read the slides at [VIM: Walking Without Crutches](http://walking-without-crutches.heroku.com/#1).
* Watch the screencasts at [vimcasts.org](http://vimcasts.org/)
* Watch Derek Wyatt's energetic tutorial videos at [his site](http://www.derekwyatt.org/vim/vim-tutorial-videos/)
* Read wycats' perspective on learning vim at
  [Everyone who tried to convince me to use vim was wrong](http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/)
* Read this and other answers to a question about vim at StackOverflow:
  [Your problem with Vim is that you don't grok vi](http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)

## Modes

* VIM has two modes:
  * insert mode- stuff you type is added to the buffer
  * normal mode- keys you hit are interpretted as commands
* To enter insert mode, hit `i`
* To exit insert mode, hit `<ESC>`

## Useful commands

* Use `:q` to exit vim
* Certain commands are prefixed with a `<Leader>` key, which maps to `\`
  by default. Use `let mapleader = ","` to change this. If you want this
  to be in effect for uses of <Leader> in your .vimrc, make sure to define
  this in the `~/.vimrc.pre`
* Keyboard [cheat sheet](http://walking-without-crutches.heroku.com/image/images/vi-vim-cheat-sheet.png).

# Features

This vim distribution includes a number of packages built by others.

## Base Customizations

Janus ships with a number of basic customizations for vim:

* Line numbers
* Ruler (line and column numbers)
* No wrap (turn off per-buffer via set :wrap)
* Soft 2-space tabs, and default hard tabs to 2 spaces
* Show tailing whitespace as `.`
* Make searching highlighted, incremental, and case insensitive unless a
  capital letter is used
* Always show a status line
* Allow backspacing over everything (identations, eol, and start
  characters) in insert mode
* `<Leader>e` expands to `:e {directory of current file}/` (open in the
  current buffer)
* `<Leader>te` expands to `:te {directory of current file}/` (open in a
  new MacVIM tab)
* `<C-P>` inserts the directory of the current file into a command

## [Command-T](https://wincent.com/products/command-t)

Command-T provides a mechanism for searching for a file inside the
current working directory. It behaves similarly to command-t in
Textmate.

**Customizations**: Janus rebinds command-t (`<D-t>`) to bring up this
plugin. It defaults to `<Leader>t`.

## [NERDCommenter](http://github.com/ddollar/nerdcommenter)

NERDCommenter allows you to wrangle your code comments, regardless of
filetype. View `:help NERDCommenter` for all the details.

**Customizations**: Janus binds command-/ (`<D-/>`) to toggle comments.

## [SuperTab](http://github.com/ervandew/supertab)

In insert mode, start typing something and hit `<TAB>` to tab-complete
based on the current context.

## Git Support ([Fugitive](http://github.com/tpope/vim-fugitive))

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file

## [ZoomWin](http://github.com/vim-scripts/ZoomWin)

When working with split windows, ZoomWin lets you zoom into a window and
out again using `Ctrl-W o`

**Customizations**: Janus binds `<Leader><Leader>` to `:ZoomWin`

## Additional Syntaxes

Janus ships with a few additional syntaxes:

* Markdown (bound to \*.markdown, \*.md, and \*.mk)
* Mustache (bound to \*.mustache)
* Arduino  (bound to \*.pde)
* Haml (bound to \*.haml)
* Sass (bound to \*.sass)
* SCSS (bound to \*.scss)
* An improved JavaScript syntax (bound to \*.js)
* Map Gemfile, Rakefile, Vagrantfile and Thorfile to Ruby
* Git commits (set your `EDITOR` to `mvim -f`)
