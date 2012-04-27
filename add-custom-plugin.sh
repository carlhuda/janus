echo   "This script is going to install custom plugin in $HOME/.janus directory"
echo   "If $HOME.janus doesn't exist it will create one.

if [ ! -d $HOME/.janus ];
           then
               mkdir $HOME/.janus;
fi

cd  $HOME/.janus

echo "1. Installing NerdTreeTab plugin"
git clone https://github.com/jistr/vim-nerdtree-tabs.git

echo "2. Installing HTML-AutocloseTag plugin"
git clone https://github.com/vim-scripts/HTML-AutoCloseTag.git

echo "3. Installing JS-beautify plugin"
git clone https://github.com/maksimr/vim-jsbeautify.git

echo "4. Installing golang plugin"
git clone https://github.com/jnwhteh/vim-golang.git
