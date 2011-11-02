module Janus
  # Errors
  JanusError = Class.new Exception
  BlockNotGivenError = Class.new JanusError
end

# Return the root path
#
# @return [String] The absolute path to Janus repository
def root_path
  @root_path ||= File.expand_path(File.dirname(__FILE__))
end

def expand(file)
  File.expand_path(file)
end

# Install a plugin
#
# @param [String] The group the plugin belongs to
# @param [String] The plugin name
# @param [&block] The installation block
def install_vim_plugin(group, name, &block)
  raise Janus::BlockNotGivenError unless block_given?

  # Create a namespace for the plugin
  namespace(name) do
    task :verify_plugin do
      unless Dir["#{root_path}/#{group}/#{name}/**"].any?
        abort "The submodule #{group}/#{name} is not ready, please run 'git submodule update --init'"
      end
    end

    # Define the plugin installation task
    desc "Install #{name} plugin."
    task :install do
      puts
      puts "*" * 40
      puts "*#{"Installing #{name}".center(38)}*"
      puts "*" * 40
      puts
      yield
    end
    task :install => :verify_plugin
  end

  # Hook the plugin's install task to the global install task
  task :install => "#{name}:install"
end

# Load all plugin installation tasks
Dir["#{root_path}/janus-*/tasks/**.rake"].each { |f| import f }

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

task :install => :update do
  # Dummy task.
end

task :default => [:install, expand("~/.vimrc"), expand("~/.gvimrc")]
