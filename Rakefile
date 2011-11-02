module Janus
  module VIM
    extend self

    # Folders
    def folders
      %w[ _backup _temp ]
    end
  end
end

def expand(file)
  File.expand_path(file)
end

task expand("~/.vimrc") => "vimrc" do
  sh "ln -s ~/.vim/vimrc ~/.vimrc"
end

task expand("~/.gvimrc") => "gvimrc" do
  sh "ln -s ~/.vim/gvimrc ~/.gvimrc"
end

desc "Create necessary folders."
task :folders do
  Janus::VIM.folders.each do |folder|
    mkdir_p folder
  end
end

task :update do
  sh "git pull"
  sh "git submodule init"
  sh "git submodule update"
end

task :default => [:update, expand("~/.vimrc"), expand("~/.gvimrc")]
