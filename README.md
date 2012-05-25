# Janus: Vim Distribution

This is a distribution of plug-ins and mappings for Vim, Gvim and
MacVim.

It is designed to provide minimal working environment using the most
popular plug-ins and the most common mappings.

The distribution is completely customisable using a `~/.vimrc.before`
and `~/.vimrc.after` Vim RC files.

# UPGRADING FROM JANUARY 1st 2012 THROUGH JANUARY 10th

Please run `rake` twice before running macvim; make sure `command-t` is
gone.

# UPGRADING FROM BEFORE JANUARY 1st 2012

If you were using Janus before January 2012, note that Janus has gone
through a rewrite to make it more stable and customizable. Most notably,
you can now disable plugins using `janus#disable_plugin` and customize
Janus using `~/.vimrc.before` and `~/.vimrc.after`. See the rest of this
`README` and the [Customization wiki page](https://github.com/carlhuda/janus/wiki/Customization).

To upgrade to the latest version:

1. remove `~/.vim`, `~/.vimrc` and `~/.gvimrc`.
2. move customizations from `~/.vimrc.local` to `~/.vimrc.before` and
   `~/.vimrc.after`.
3. Do the same with `/.gvimrc.local`.
4. Run the installer: `curl -Lo- https://bit.ly/janus-bootstrap | bash`

## Updating to the latest version (from any time after January 10th, 2012)

To update to the latest version of the distribution, just run `rake`
inside your `~/.vim` directory.

NOTE: If you ever have an error updating Janus relating to a
missing commit in a submodule, please try running `rake` again before
submitting an issue.

## Mailing list

The mailing list is hosted at [Google
Groups](http://groups.google.com/group/janus-vimius), please join it for
discussion and announcements.

## Pre-requisites

The distribution is designed to work with Vim >= 7.3.

The distribution also requires `ack`, `ctags`, `git`, `ruby` and `rake`.
For the most comfortable experience, use the GUI version of Vim. Linux
users should install `gvim`, OSX users should install
[MacVim](http://code.google.com/p/macvim/). The recommended way of
installing MacVim is using
[Homebrew](http://mxcl.github.com/homebrew/), but before installing
MacVim you need to use system-wide Python (If you are using python that
is):

* If you're using **pythonbrew**: do `pythonbrew off`

```bash
$ brew install macvim
```

If you don't use Homebrew, you can still download MacVim
[here](https://github.com/b4winckler/macvim/downloads).

Take a look at the [Pre-requisites wiki
page](https://github.com/carlhuda/janus/wiki/Pre-requisites) for more
information.


## Installation

To install Janus, please use our [automatic
installer](https://github.com/carlhuda/janus/blob/master/bootstrap.sh)
, which backs up any Vim files found in your home folder and installs
Janus.

```bash
$ curl -Lo- https://bit.ly/janus-bootstrap | bash
```

## Customization

You can use `~/.gvimrc.before` and `~/.vimrc.before` for settings Janus itself uses,
such as the __leader__ setting. You may also use `~/.gvimrc.after` and
`~/.vimrc.after` for any additional settings; it is also a good place for
overriding Janus settings, as both files will be loaded at the end of
Janus.

For example, to override the default color schemes:

```bash
$ echo 'color desert'  >> ~/.vimrc.after
$ echo 'color molokai' >> ~/.gvimrc.after
```

If you want to do additional customization or add more Vim plugins,
create a `~/.janus` directory and add your plugins there, either with a
`git clone` or by adding submodules to your own git repository there.
This directory is treated like a normal pathogen directory. For example:

```bash
$ cd ~/.janus
$ git clone https://github.com/vim-scripts/Rename2.git rename2
```

Or, if you have a git repository in `~/.janus`, you can use a submodule:

```bash
$ cd ~/.janus
$ git submodule add https://github.com/vim-scripts/Rename2.git rename2
```

If you would like to disable an included plug-in, you can do that with
the `janus#disable_plugin()` function from inside your
`~/.vimrc.before`. This function takes a plug-in name as an argument
without the group. For example, if you would like to disable the
NERDCommenter plug-in, you can do that with the command:

```bash
$ echo "call janus#disable_plugin('nerdcommenter')" >> ~/.vimrc.before
```

**WARNING**: We've noticed over and over, that people fork Janus just to
customize it. This is bad practice for several reasons and you should
not do that, and here's why:

- Janus is fully customisable and there's no need to change the core for
  using a different plugin fork or using a different mapping.
- Forking means maintenance; maintenance means burden. Do not burden
  yourself with maintaining a fork; that's what the `~/.janus` folder
  is for.

If you find yourself needing a customisation that is not possible with
the current setup, then please open an issue or consider submitting a
pull request to make it possible to continue using/improving the official repo.

**WARNING**: Any **uncommited** files inside the **janus** folder will be
removed the next time you run `rake` so make sure to either put them in
the custom folder (`~/.janus`), or commit them. We clean the janus
folder in case we replace a manually installed plugin (using rake tasks)
with a submodule.

For more information on how to customize Janus, you might want to take
a look at the [Customization wiki
page](https://github.com/carlhuda/janus/wiki/Customization).

# Intro to VIM

Here're some tips in case you've never used VIM before:

## Tutorials

* Type `vimtutor` into a shell to go through a brief interactive
  tutorial inside VIM.
* Read the slides at [VIM: Walking Without Crutches](http://walking-without-crutches.heroku.com/#1).
* Watch the screencasts at [vimcasts.org](http://vimcasts.org/)
* Watch Derek Wyatt's energetic tutorial videos at [his site](http://www.derekwyatt.org/vim/vim-tutorial-videos/)
* Read wycats' perspective on learning Vim at
  [Everyone who tried to convince me to use vim was wrong](http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/)
* Read this and other answers to a question about vim at StackOverflow:
  [Your problem with Vim is that you don't grok vi](http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)

## Modes

* VIM has two modes:
  * insert mode- stuff you type is added to the buffer
  * normal mode- keys you hit are interpreted as commands
* To enter insert mode, hit `i`
* To exit insert mode, hit `<ESC>`

## Useful commands

* Use `:q` to exit vim
* Certain commands are prefixed with a `<Leader>` key, which maps to `\`
  by default. You can, for example, use `let mapleader = ","` to change this to a comma. If you want this
  to be in effect for uses of `<Leader>` in the .vimrc file, make sure to define
  this in `~/.vimrc.before`
* Keyboard [cheat sheet](http://walking-without-crutches.heroku.com/image/images/vi-vim-cheat-sheet.png).

# Features

This Vim distribution includes a number of packages built by others.

## Base Customizations

Janus ships with a number of basic customizations for vim:

* Line numbers
* Ruler (line and column numbers)
* No wrap (turn off per-buffer via :set wrap)
* Soft 2-space tabs, and default hard tabs to 2 spaces
* Show trailing whitespace as `.`
* Make searching highlighted, incremental, and case insensitive unless a
  capital letter is used
* Always show a status line
* Allow backspacing over everything (indentations, eol, and start
  characters) in insert mode
* `<C-P>` inserts the directory of the current file into a command
* Automatically resize splits when resizing the Vim window (GUI only)
* `<leader>ew` expands to `:e (directory of current file)/` (open in the
  current buffer)
* `<leader>es` expands to `:sp (directory of current file)/` (open in a
  horizontal split)
* `<leader>ev` expands to `:vsp (directory of current file)/` (open in
  a vertical split)
* `<leader>et` expands to `:tabe (directory of current file)/` (open in
  a new tab)
* `:w!!` expands to `%!sudo tee > /dev/null %`. Write to the current file
  using sudo (if you forgot to run it with sudo), it will prompt for
sudo password when writing
* `<F4>` toggles paste mode
* `<leader>fef` formats the entire file
* `<leader>u` converts the entire word to uppercace
* `<leader>l` converts the entire word to lowercase
* `<leader>U` converts the first char of a word to uppercase
* `<leader>L` converts the first char of a word to lowercase
* `<leader>cd` changes the path to the active buffer's file
* `<leader>md` creates the directory of the active buffer's file
  (For example, when editing a new file for which the path does not
exist.)
* `gw` swaps the current word with the following word
* `<leader>ul` underlines the current line with `=`
* `<leader>tw` toggles wrap
* `<leader>fc` finds the next conflict marker (tested with Git
  conflicted files)
* Remap `<Down>` and `<Up>` to `gj` and `gk` (Wrapped text is not
  considered a single long line of text.)
* `<leader>hs` toggles highlight search
* `<leader>=` adjusts viewports to the same size (`<C-w>=`)
* `<A-[` (`<D-[` on MacVim) shifts current line or selected lines
  rightwards
* `<A-]` (`<D-]` on MacVim) shifts current line or selected lines
  leftwards
* `<C-W>!` invokes kwbd plugin; it closes all open buffers in the open
  windows but keeps the windows open

## [Ack.vim](http://github.com/mileszs/ack.vim)

Ack.vim uses ack to search inside the current directory for a pattern.
You can learn more about it with :help Ack.

**Customizations**: Janus rebinds command-shift-f (`<D-F>`) to bring up
`:Ack `.

## [CtrlP](https://github.com/kien/ctrlp.vim)

Fuzzy file, buffer, mru and tag finder. Replaces [Command-T](https://github.com/wincent/Command-T)

**Customizations**: For users of Command-T Janus maps CtrlP to command-t (`<D-t>`)

## [NERDCommenter](http://github.com/ddollar/nerdcommenter)

NERDCommenter allows you to wrangle your code comments, regardless of
filetype. View `:help NERDCommenter` for all the details.

**Customizations**: Janus binds command-/ (`<D-/>`) to toggle comments.

## [NERDTree](https://github.com/scrooloose/nerdtree)

NERDTree is a file explorer plugin that provides "project drawer"
functionality to your vim projects.  You can learn more about it with
:help NERDTree.

**Customizations**: Janus adds a number of customizations to the core
NERDTree:

* Use `<Leader>n` to toggle NERDTree
* Ignore compiled ruby, python, and java files
* When opening vim with vim /path, open the left NERDTree to that
  directory, set the vim pwd, and clear the right buffer
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

**Customizations**: Janus binds `<Leader>rt` to toggle Tagbar.

## [EasyMotion](https://github.com/Lokaltog/vim-easymotion)

EasyMotion provides a much simpler way to use some motions in vim. It
takes the <number> out of <number>w or <number>f{char} by highlighting
all possible choices and allowing you to press one key to jump directly
to the target.

When one of the available motions is triggered, all visible text
preceding or following the cursor is faded, and motion targets are
highlighted.

EasyMotion is triggered by one of the provided mappings.

check EasyMotion's [home
page](https://github.com/Lokaltog/vim-easymotion) for more information.

## [NrrwRgn](https://github.com/chrisbra/NrrwRgn)

Narrowing means focussing on a region and making the rest inaccessible.
You simply select the region, call :NarrowRegion and the selected part
will open in a new scratch buffer. The rest of the file will be
protected, so you won't accidentally modify that buffer. In the new
buffer, you can do a global replace, search or anything else to modify
that part. When you are finished, simply write that buffer (e.g. by
|:w|) and your modifications will be put in the original buffer making
it accessible again.

## Git Support ([Fugitive](http://github.com/tpope/vim-fugitive))

Fugitive adds pervasive git support to git directories in vim. For more
information, use `:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or
unstage it. Type `p` on a file to enter `git add -p` and stage specific
hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that
file

**customizations**:

* `<leader>gb` maps to `:Gblame<CR>`
* `<leader>gs` maps to `:Gstatus<CR>`
* `<leader>gd` maps to `:Gdiff<CR>`
* `<leader>gl` maps to `:Glog<CR>`
* `<leader>gc` maps to `:Gcommit<CR>`
* `<leader>gp` maps to `:Git push<CR>`

## [ZoomWin](http://github.com/vim-scripts/ZoomWin)

When working with split windows, ZoomWin lets you zoom into a window and
out again using `Ctrl-W o`

**Customizations**: Janus binds `<leader>zw` to `:ZoomWin`

## [BufferGator](https://github.com/jeetsukumaran/vim-buffergator)

Buffergator is a plugin for listing, navigating between, and selecting
buffers to edit. Upon invocation (using the command, `:BuffergatorOpen`
or `BuffergatorToggle`, or the provided key mapping, `<Leader>b`), a
`catalog` of listed buffers are displayed in a separate new window split
(vertical or horizontal, based on user options; default = vertical).
From this "buffer catalog", a buffer can be selected and opened in an
existing window, a new window split (vertical or horizontal), or a new
tab page.

Selected buffers can be "previewed", i.e. opened in a window or tab
page, but with focus remaining in the buffer catalog. Even better, you
can "walk" up and down the list of buffers shown in the catalog by using
`<C-N>` (or `<SPACE>`) / `<C-P>` (or `<C-SPACE>`). These keys select the
next/previous buffer in succession, respectively, opening it for preview
without leaving the buffer catalog viewer.

## [Vroom](https://github.com/skalnik/vim-vroom)

VRoom is a plugin inspired by [Gary Bernhardt's vim
config](https://github.com/garybernhardt/dotfiles/blob/69330074b7a15c67efa4594a71fa91592f1ce4f9/.vimrc#L286-342) 
for running your ruby tests/specs/features.

Imagine you're hacking on a Rails controller, when you switch to the
test or specs for the controller, you can use `<leader>r` to run all the
specs or `<leader>R` to run the closest spec, then you can jump back to
the controller hack on it and use `<leader>r` to run the last spec you
ran last time, so you don't need to open the test again.

Then benefits of this plugin are to centralize your workflow in one
window, one software to do it all, which is a huge speedup over using
`tmux` or multiple terminal tabs.

## Additional Syntaxes

Janus ships with a few additional syntaxes:

* Markdown (bound to \*.markdown, \*.md, and \*.mk)
* Mustache (bound to \*.mustache)
* Haml (bound to \*.haml)
* Sass (bound to \*.sass)
* SCSS (bound to \*.scss)
* An improved JavaScript syntax (bound to \*.js)
* Javascript for any file having `nodejs` in the shebang.
* Map Gemfile, Rakefile, Vagrantfile, Procfile, Thorfile, config.ru and
  *.rake to Ruby.
* Git commits (set your `EDITOR` to `vim -f` or  `mvim -f` on OSX)
  `$ echo "export EDITOR='vim -f'" >> ~/.bashrc`, you can also use Git
  global config to set this if you have EDITOR set to something else
  `$ git config --global core.editor 'vim -f'`

## Rakefile

If you're looking for the old janus distribution controlled by a
Rakefile then please head over to the [rakefile
branch](https://github.com/carlhuda/janus/tree/rakefile) but please note
that the rakefile branch will not be maintained.

## License

### This code is free to use under the terms of the MIT license.

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
