# Janus: Vim Distribution

This is a distribution of plug-ins and mappings for Vim, Gvim and
MacVim. It is forked from https://github.com/carlhuda/janus however I am also adding few plugins and modified .vimrc.after
file so that other can use it directly. In case you face any issue please let me know.

 Extra plugins added
 
    https://github.com/jistr/vim-nerdtree-tabs 
    https://github.com/vim-scripts/HTML-AutoCloseTag 
    https://github.com/maksimr/vim-jsbeautify
    https://github.com/jnwhteh/vim-golang
    https://github.com/hallettj/jslint.vim
    
Apart from nice features provided by Janus Following extra features have been added<br />

1. NerdTree will open in each tab by default - It will always look the
   same in all tabs<br />
2. Autocomplete for Html, XML, XSL, XHTML file extension by default<br />
3. By Default XML opened will be folded<br />
4. Remove trailing whitespaces and ^M chars<br />
5. Golang support<br />
6. JSLint support <br />

#Usage Instructions
1. run the add-custom-plugin.sh file
2. copy content from .vimrc.after and append it in your .vimrc.after
   file which is located in $HOME directory

#Extra Item
To use 'go to definition' I am using ctags. To generate tags use following command in your project directory<br />
ctags *

And add following line in your .vimrc.after<br />
 set tags=tags,./tags;$HOME

further you can use following keyboard shortcuts<br />
C-] - go to definition <br />
C-T - Jump back from the definition.<br />
C-W C-] - Open the definition in a horizontal split<br />

C-\ - Open the definition in a new tab<br />
A-] - Open the definition in a vertical split<br />

After the tags are generated. You can use the following keys to tag into and tag out of functions:


It is designed to provide minimal working environment using the most
popular plug-ins and the most common mappings.

The distribution is completely customisable using a `~/.vimrc.before`
and `~/.vimrc.after` Vim RC files.


## Customization

For  information on how to customize Janus, you might want to take
a look at the [Customization wiki
page](https://github.com/carlhuda/janus/wiki/Customization).

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
