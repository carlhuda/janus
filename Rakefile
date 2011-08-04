def expand(file)
  File.expand_path(file)
end

task expand("~/.vimrc") => "vimrc" do
  sh "ln -s ~/.vim/vimrc ~/.vimrc"
end

task expand("~/.gvimrc") => "gvimrc" do
  sh "ln -s ~/.vim/gvimrc ~/.gvimrc"
end

task :update do
  sh "git pull"
  sh "git submodule init"
  sh "git submodule update"
end

task :default => [:update, expand("~/.vimrc"), expand("~/.gvimrc")]
