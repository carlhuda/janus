# Return the root path
#
# @return [String] The absolute path to Janus repository
def root_path
  @root_path ||= File.expand_path(File.dirname(__FILE__))
end

def expand(file)
  File.expand_path(file)
end

namespace :plugins do
  task :install do
    # dummy task for plugins installations hooku.
  end
end

Dir["#{root_path}/janus-*/tasks/**.rake"].each { |f| load f }

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

task :install => [:update, "plugins:install"] do
  # Dummy task to run plugins installation tasks
end

task :default => [:install, expand("~/.vimrc"), expand("~/.gvimrc")]
