ROOT_PATH = File.expand_path(File.join(File.dirname(__FILE__)))
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

<<<<<<< HEAD
vim_plugin_task "ack.vim",          "http://github.com/mileszs/ack.vim.git"
vim_plugin_task "color-sampler",    "http://www.vim.org/scripts/download_script.php?src_id=12179"
vim_plugin_task "conque",           "http://conque.googlecode.com/files/conque_1.1.tar.gz"
vim_plugin_task "fugitive",         "http://github.com/tpope/vim-fugitive.git"
vim_plugin_task "git",              "http://github.com/tpope/vim-git.git"
vim_plugin_task "haml",             "http://github.com/tpope/vim-haml.git"
vim_plugin_task "indent_object",    "http://github.com/michaeljsmith/vim-indent-object.git"
vim_plugin_task "javascript",       "http://github.com/pangloss/vim-javascript.git"
vim_plugin_task "markdown_preview", "http://github.com/robgleeson/vim-markdown-preview.git"
vim_plugin_task "nerdtree",         "http://github.com/scrooloose/nerdtree.git"
vim_plugin_task "nerdcommenter",    "http://github.com/scrooloose/nerdcommenter.git"
vim_plugin_task "surround",         "http://github.com/tpope/vim-surround.git"
vim_plugin_task "taglist",          "http://vim.sourceforge.net/scripts/download_script.php?src_id=7701"
vim_plugin_task "vividchalk",       "http://github.com/tpope/vim-vividchalk.git"
vim_plugin_task "supertab",         "http://github.com/ervandew/supertab.git"
vim_plugin_task "cucumber",         "http://github.com/tpope/vim-cucumber.git"
vim_plugin_task "textile",          "http://github.com/timcharper/textile.vim.git"
vim_plugin_task "rails",            "http://github.com/tpope/vim-rails.git"
vim_plugin_task "rspec",            "http://github.com/taq/vim-rspec.git"
vim_plugin_task "zoomwin",          "http://www.vim.org/scripts/download_script.php?src_id=9865"
vim_plugin_task "snipmate",         "http://github.com/msanders/snipmate.vim.git"
vim_plugin_task "autoclose",        "http://github.com/Townk/vim-autoclose.git"
vim_plugin_task "markdown",         "http://github.com/tpope/vim-markdown.git"
vim_plugin_task "align",            "http://github.com/tsaleh/vim-align.git"
=======
namespace :dev do
  desc "Update submodules"
  task :update_submodules do
    sh "git submodule foreach git pull origin master"
  end
>>>>>>> upstream/master

  # Taken from RefineryCMD
  # https://github.com/resolve/refinerycms/blob/master/core/lib/tasks/refinery.rake
  desc 'Removes trailing whitespace across the entire application.'
  task :whitespace do
    require 'rbconfig'
    if RbConfig::CONFIG['host_os'] =~ /linux/
      sh %{find . -name '*.*rb' -o -name '*.*vim' -exec sed -i 's/\t/ /g' {} \\; -exec sed -i 's/ *$//g' {} \\; }
    elsif RbConfig::CONFIG['host_os'] =~ /darwin/
      sh %{find . -name '*.*rb' -o -name '*.*vim' -exec sed -i '' 's/\t/ /g' {} \\; -exec sed -i '' 's/ *$//g' {} \\; }
    else
      puts "This doesn't work on systems other than OSX or Linux. Please use a custom whitespace tool for your platform '#{RbConfig::CONFIG["host_os"]}'."
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
  sh "rake update"
  sh "rake install"
end
