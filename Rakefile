ROOT_PATH = File.expand_path(File.dirname(__FILE__))
$: << File.join(ROOT_PATH, 'janus', 'ruby')

require 'janus'
require 'fileutils'
include Janus

desc "link ViM configuration files."
task :link_vim_conf_files do
  %w[ vimrc gvimrc ].each do |file|
    dest = expand("~/.#{file}")
    unless File.exist?(dest)
      ln_s(expand("../janus/vim/#{file}", __FILE__), dest)
    end
  end
end

namespace :dev do
  desc "Update submodules"
  task :update_submodules do
    sh "git submodule foreach git pull origin master"
  end
end

desc "Create necessary folders."
task :folders do
  Janus::VIM.folders.each do |folder|
    mkdir_p folder
  end
end

task :update do
  puts "Cleaning the janus folder"
  `git clean -xdf -- janus &> /dev/null`
  `git ls-files --exclude-standard --others -- janus`.split("\n").each do |untracked|
    FileUtils.rm_rf File.expand_path(untracked.chomp, File.dirname(__FILE__))
  end

  puts "Pulling latest changes"
  `git pull > /dev/null`

  puts "Cleaning the janus folder"
  `git clean -xdf -- janus &> /dev/null`
  `git ls-files --exclude-standard --others -- janus`.split("\n").each do |untracked|
    FileUtils.rm_rf File.expand_path(untracked.chomp, File.dirname(__FILE__))
  end

  puts "Synchronising submodules urls"
  `git submodule sync > /dev/null`

  puts "Updating the submodules"
  `git submodule update --init > /dev/null`
end

task :install => [:folders, :link_vim_conf_files] do
  # Dummy task, real work is done with the hooks.
end

desc "Install or Update Janus."
task :default do
  Rake::Task['update'].invoke
  Rake::Task['install'].invoke
end
