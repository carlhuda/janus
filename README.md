# Vimius: Vim Distribution [![Still Maintained](http://stillmaintained.com/TechnoGate/vimius.png)](http://stillmaintained.com/TechnoGate/vimius)

[![Click here to lend your support to: Open Source Projects and make a donation at www.pledgie.com!](http://pledgie.com/campaigns/16123.png?skin_name=chrome)](http://www.pledgie.com/campaigns/16123)

This is a distribution of plug-ins and mappings for Vim, Gvim and
MacVim.

It is designed to provide minimal working environment using the most
popular plug-ins and the most common mappings.

The distribution is completely customisable using a `~/.vimrc.before`
and `~/.vimrc.after` Vim RC files.

## Pre-requisites

The distribution is designed to work with ViM >= 7.3.

The distribution also require `ack`, `pep8`, `ctags`, `ruby` and `rake`,
for the most comfortable experience, use the gui version of ViM. Linux
users should install `gvim`, OSX users should install
[MacVim](http://code.google.com/p/macvim/), Download it
[here](https://github.com/b4winckler/macvim/downloads).

Take a look at the [Pre-requisites wiki
page](https://github.com/TechnoGate/vimius/wiki/Pre-requisites) for more
information.


## Installation

To install Vimius, please use our [automatic
installer](https://github.com/TechnoGate/vimius/blob/master/bootstrap.sh)
, which backups up any Vim files found in your home folder and installs
Vimius.

```bash
$ curl https://raw.github.com/TechnoGate/vimius/master/bootstrap.sh -o- | sh
```

## Customization

You can use `~/.gvimrc.before` and `~/.vimrc.before` for settings Vimius,
like the __leader__ setting, you may also use `~/.gvimrc.after` and
`~/.vimrc.after` for any additonal setting, it is also a good place for
overriding Vimius settings as both files will be loaded at the end of
Vimius

For example, to override the default color schemes:

```bash
$ echo 'color desert'  >> ~/.vimrc.after
$ echo 'color molokai' >> ~/.gvimrc.after
```

If you want to add additional Vim plugins you can do so by adding a new
submodule in the Vimius repository inside the `vimius/vim/custom` like so:

```bash
$ cd ~/.vim
$ git submodule add git://github.com/vim-scripts/Rename2.git vimius/vim/custom/rename2
```

If you would like to disable an included plugin, you can do that with
the `vimius#disable_plugin()` function from inside your
`~/.vimrc.before`, this function takes a plugin name as an argument
without the group, for example, if you would like to disable the
NERDCommenter plugin, you can do that with the command:

```bash
$ echo "call vimius#disable_plugin('nerdcommenter')" >> ~/.vimrc.before
```

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
  this in the `~/.vimrc.before`
* Keyboard [cheat sheet](http://walking-without-crutches.heroku.com/image/images/vi-vim-cheat-sheet.png).

# Features

This vim distribution includes a number of packages built by others.

## Base Customizations

Vimius ships with a number of basic customizations for vim:

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
* Automatically resize splits when resizing the MacVim window

## [Ack.vim](http://github.com/mileszs/ack.vim)

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with :help Ack

**Customizations**: Vimius rebinds command-shift-f (`<D-F>`) to bring up
`:Ack `.

## [Command-T](https://wincent.com/products/command-t)

Command-T provides a mechanism for searching for a file inside the
current working directory. It behaves similarly to command-t in
Textmate.

**Customizations**: Vimius rebinds command-t (`<D-t>`) to bring up this
plugin. It defaults to `<Leader>t`.

## [NERDCommenter](http://github.com/ddollar/nerdcommenter)

NERDCommenter allows you to wrangle your code comments, regardless of
filetype. View `:help NERDCommenter` for all the details.

**Customizations**: Vimius binds command-/ (`<D-/>`) to toggle comments.

## [NERDTree](https://github.com/scrooloose/nerdtree)

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim projects.  You can learn more about it with
:help NERDTree.

**Customizations**: Vimius adds a number of customizations to the core
NERDTree:

* Use `<Leader>n` to toggle NERDTree
* Ignore compiled ruby, python, and java files
* Automatically activate NERDTree when MacVIM opens and make the
  original buffer the active one
* Provide alternative :e, :cd, :rm and :touch abbreviations which also
  refresh NERDTree when done (when NERDTree is open)
* When opening vim with vim /path, open the left NERDTree to that
  directory, set the vim pwd, and clear the right buffer
* Disallow `:e`ing files into the NERDTree buffer
* In general, assume that there is a single NERDTree buffer on the left
  and one or more editing buffers on the right

## [SuperTab](http://github.com/ervandew/supertab)

In insert mode, start typing something and hit `<TAB>` to tab-complete
based on the current context.

## [Syntastic](https://github.com/scrooloose/syntastic/)

Syntastic is a syntax checking plugin that runs buffers through external syntax 
checkers as they are saved and opened. If syntax errors are detected, the user 
is notified and is happy because they didn't have to compile their code or 
execute their script to find them.

## [Tagbar](https://github.com/majutsushi/tagbar)

Tagbar is a vim plugin for browsing the tags of source code files.

**Customizations**: Vimius binds `<Leader>rt` to toggle Tagbar.

## [EasyMotion](https://github.com/Lokaltog/vim-easymotion)

EasyMotion provides a much simpler way to use some motions in vim. It
takes the <number> out of <number>w or <number>f{char} by highlighting
all possible choices and allowing you to press one key to jump directly
to the target.

When one of the available motions is triggered, all visible text
preceding or following the cursor is faded, and motion targets are
highlighted.

EasyMotion is triggered by one of the provided mappings.

check EasyMotion's [home page](https://github.com/Lokaltog/vim-easymotion)

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

**Customizations**: Vimius binds `<leader>zw` to `:ZoomWin`

## Additional Syntaxes

Vimius ships with a few additional syntaxes:

* Markdown (bound to \*.markdown, \*.md, and \*.mk)
* Mustache (bound to \*.mustache)
* Arduino  (bound to \*.pde)
* Haml (bound to \*.haml)
* Sass (bound to \*.sass)
* SCSS (bound to \*.scss)
* An improved JavaScript syntax (bound to \*.js)
* Map Gemfile, Rakefile, Vagrantfile and Thorfile to Ruby
* Git commits (set your `EDITOR` to `mvim -f`)

## Credits

Vimius is based on [Carlhuda's Janus
distribution](https://github.com/carlhuda/janus).

## License

### This code is free to use under the terms of the MIT license.

Copyright (c) 2011 TechnoGate &lt;support@technogate.fr&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
