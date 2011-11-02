module Janus
  module VIM
    extend self

    # Folders
    def folders
      %w[ _backup _temp ]
    end
  end
end

# Expand the path of a given file
#
# @param [String] file
# @return [String] The expanded path to the given file.
def expand(file)
  File.expand_path(file)
end

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

task :default => [:update, :folders, :link_vim_conf_files]
