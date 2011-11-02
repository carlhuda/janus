module Janus
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

namespace :plugins do
  task :install do
    # dummy task for plugin installation tasks.
  end
end

Dir["#{root_path}/janus-*/tasks/**.rake"].each { |f| load f }

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

task :install => [:update, :folders, "plugins:install"] do
  # Dummy task to run plugin installation tasks
end

task :default => [:update, :folders, :install, :link_vim_conf_files]
