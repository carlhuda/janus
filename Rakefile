module Janus
  # Errors
  JanusError = Class.new Exception
  BlockNotGivenError = Class.new JanusError
  RubyGemsNotFoundError = Class.new JanusError

  module VIM
    extend self

    # Folders
    def folders
      %w[ _backup _temp ]
    end
  end
end

# Return the root path
#
# @return [String] The absolute path to Janus repository
def root_path
  @root_path ||= File.expand_path(File.dirname(__FILE__))
end

# Expand the path of a given file
#
# @param [String] file
# @return [String] The expanded path to the given file.
def expand(file)
  File.expand_path(file)
end

# Find an installed gem
#
# @param [String] The gem name to search for
# @return [Array] The found gems
def find_gem(gem_name)
  begin
    require 'rubygems'
    if Gem.const_defined?(:Specification)
      Gem::Specification.find_all_by_name(gem_name)
    elsif Gem.respond_to?(:source_index)
      Gem.source_index.find_name(gem_name)
    else
      Gem.cache.find_name(gem_name)
    end
  rescue LoadError
    raise Janus::RubyGemsNotFoundError
  end
end

# Install a gem
#
# @param [String] The gem name
def install_gem(gem_name)
  require 'rubygems'

  # Install the gem only if it can't be found
  if find_gem(gem_name).length == 0
    sh "gem install #{gem_name}"
  end
rescue Janus::RubyGemsNotFoundError
  puts "Could not install the gem #{gem_name}, please do so manually."
  puts "gem install #{gem_name}"
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

desc "link ViM configuration files."
task :link_vim_conf_files do
  %w[ vimrc gvimrc ].each do |file|
    dest = expand("~/.#{file}")
    unless File.exist?(dest)
      ln_s(expand("../#{file}", __FILE__), dest)
    end
  end
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

task :install => [:update, :folders] do
  # Dummy task.
end

task :default => [:install, :link_vim_conf_files]
