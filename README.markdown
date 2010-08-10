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

## Base Customizations

Janus ships with a number of basic customizations for vim:

* Line numbers
* Ruler (line and column numbers)
* No wrap (turn off per-buffer via set :wrap)
* Soft 2-space tabs, and default hard tabs to 2 spaces
* Show tabs as `|_` and tailing whitespace as `.`
* Make searching highlighted, incremental, and case insensitive unless a capital letter is used
* Always show a status line
* Allow backspacing over everything (identations, eol, and start characters) in insert mode
* \<Leader\>e expands to `:e {directory of current file}/` (open in the current buffer)
* \<Leader\>tr expands to `:te {directory of current file}/` (open in a new MacVIM tab)
* \<C-P\> inserts the directory of the current file into a command

## "Project Drawer" aka NERDTree

NERDTree is a file explorer plugin that provides "project drawer" functionality to your vim projects. 
You can learn more about it with :help NERDTree.

**Customizations**: Janus adds a number of customizations to the core NERDTree:

* Ignore `*.rbc` and `*~` files
* Automatically activate NERDTree when MacVIM opens and make the original buffer the active one
* Provide alternative :e, :cd, :rm and :touch abbreviations which also refresh NERDTree when done
  (when NERDTree is open)
* When opening vim with vim /path, open the left NERDTree to that directory, set the vim pwd,
  and clear the right buffer
* Disallow `:e`'ing files into the NERDTree buffer
* In general, assume that there is a single NERDTree buffer on the left and one or more editing
  buffers on the right

## Ack.vim

Ack.vim uses ack to search inside the current directory for a pattern. You can learn more about it with
:help Ack

**Customizations**: Janus rebinds command-shift-f (<D-F>) to bring up `:Ack `.

## Command-T

Command-T provides a mechanism for searching for a file inside the current working directory. It
behaves similarly to command-t in Textmate.

**Customizations**: Janus rebinds command-t (<D-t>) to bring up this plugin. It defaults to
\<Leader\>t.

## indent\_object

Indent object creates a "text object" that is relative to the current ident. Text objects work
inside of visual mode, and with `c` (change), `d` (delete) and `y` (yank). For instance, try
going into a method in normal mode, and type `v ii`. Then repeat `ii`.

**Note**: indent\_object seems a bit busted. It would also be nice if there was a text object
for Ruby `class` and `def` blocks.

## surround

Surround allows you to modify "surroundings" around the current text. For instance, if the
cursor was inside `"foo bar"`, you could type `cs"'` to convert the text to `'foo bar'`.

There's a lot more; check it out at `:help surround`

## Git Support (Fugitive)

Fugitive adds pervasive git support to git directories in vim. For more information, use
`:help fugitive`

Use `:Gstatus` to view `git status` and type `-` on any file to stage or unstage it. Type `p` on
a file to enter `git add -p` and stage specific hunks in the file.

Use `:Gdiff` on an open file to see what changes have been made to that file 

## Markdown Preview

Markdown preview takes the current buffer, converts the Markdown to HTML, and opens it in your
default browser.

**Customizations**: Janus binds \<Leader\>p to this plugin.

## Additional Syntaxes

Janus ships with a few additional syntaxes:

* Markdown (bound to \*.markdown, \*.md, and \*.mk)
* Mustache (bound to \*.mustache)
* Haml (bound to \*.haml)
* Sass (bound to \*.sass)
* SCSS (bound to \*.scss)
* An improved JavaScript syntax (bound to \*.js)
* Map Gemfile, Rakefile and Thorfile to Ruby

## Color schemes

Janus includes the vim color sampler pack, which includes [over 100 popular color themes](http://www.vi-improved.org/color_sampler_pack/):

* jellybeans
* matrix
* railscasts2
* tango
* vibrantink
* vividchalk
* wombat
* xoria256

Use `:color vibrantink` to switch to a color scheme.
