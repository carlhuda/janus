ROOT_PATH = File.expand_path(File.join(File.dirname(__FILE__)))
$: << File.join(ROOT_PATH, 'vimius', 'ruby')

require 'Vimius'
include Vimius

desc "link ViM configuration files."
task :link_vim_conf_files do
  %w[ vimrc gvimrc ].each do |file|
    dest = expand("~/.#{file}")
    unless File.exist?(dest)
      ln_s(expand("../vimius/vim/#{file}", __FILE__), dest)
    end
  end
end

namespace :dev do
  desc "Update submodules"
  task :update_submodules do
    submodules.each do |submodule|
      update_submodule(submodule)
    end
  end
end

desc "Create necessary folders."
task :folders do
  Vimius::VIM.folders.each do |folder|
    mkdir_p folder
  end
end

task :update do
  sh "git pull"
  sh "git submodule init"
  sh "git submodule update"
end

task :install => [:folders, :link_vim_conf_files] do
  # Dummy task, real work is done with the hooks.
end

desc "Install or Update Vimius."
task :default do
  sh "rake update"
  sh "rake install"
end
