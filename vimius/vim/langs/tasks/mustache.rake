install_vim_plugin "langs", "mustache" do
  require 'open-uri'
  mkdir_p "vimius/vim/langs/mustache/syntax"
  mkdir_p "vimius/vim/langs/mustache/ftdetect"

  File.open "vimius/vim/langs/mustache/syntax/mustache.vim", "w" do |f|
    f.write(open("https://raw.github.com/defunkt/mustache/master/contrib/mustache.vim").read)
  end

  File.open "vimius/vim/langs/mustache/ftdetect/mustache.vim", "w" do |f|
    f.write "au BufNewFile,BufRead *.mustache setf mustache"
  end
end
