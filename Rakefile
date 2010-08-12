module VIM
  Dirs = %w[ doc plugin ruby syntax ftdetect ftplugin colors indent ]
end

directory "tmp"
VIM::Dirs.each do |dir|
  directory(dir)
end

def vim_plugin_task(name, repo=nil)
  cwd = File.expand_path("../", __FILE__)
  dir = "tmp/#{name}"
  subdirs = VIM::Dirs

  namespace(name) do
    if repo
      file dir => "tmp" do
        if repo =~ /git$/
          sh "git clone #{repo} #{dir}"
        elsif repo =~ /download_script/
          sh "curl #{repo} > #{dir}.zip"
          sh "unzip -o #{dir}.zip -d #{dir}"
        else
          raise ArgumentError, 'unrecognized source url for plugin'
        end
      end

      task :pull => dir do
        if repo =~ /git$/
          Dir.chdir dir do
            sh "git pull"
          end
        end
      end

      task :install => [:pull] + subdirs do
        Dir.chdir dir do
          if File.exists?("Rakefile") and `rake -T` =~ /^rake install/
            sh "rake install"
          elsif File.exists?("install.sh")
            sh "sh install.sh"
          else
            subdirs.each do |subdir|
              if File.exists?(subdir)
                sh "cp -rf #{subdir}/* #{cwd}/#{subdir}/"
              end
            end
          end
        end

        yield if block_given?
      end
    else
      task :install => subdirs do
        yield if block_given?
      end
    end
  end

  desc "Install #{name} plugin"
  task name do
    puts
    puts "*" * 40
    puts "*#{"Installing #{name}".center(38)}*"
    puts "*" * 40
    puts
    Rake::Task["#{name}:install"].invoke
  end
  task :default => name
end

vim_plugin_task "ack.vim",          "http://github.com/mileszs/ack.vim.git"
vim_plugin_task "color-sampler",    "http://www.vim.org/scripts/download_script.php?src_id=12179"
vim_plugin_task "fugitive",         "http://github.com/tpope/vim-fugitive.git"
vim_plugin_task "haml",             "http://github.com/tpope/vim-haml.git"
vim_plugin_task "indent_object",    "http://github.com/michaeljsmith/vim-indent-object.git"
vim_plugin_task "javascript",       "http://github.com/pangloss/vim-javascript.git"
vim_plugin_task "markdown",         "http://github.com/tpope/vim-markdown.git"
vim_plugin_task "markdown_preview", "http://github.com/robgleeson/vim-markdown-preview.git"
vim_plugin_task "nerdtree",         "http://github.com/scrooloose/nerdtree.git"
vim_plugin_task "surround",         "http://github.com/tpope/vim-surround.git"
vim_plugin_task "taglist",          "http://vim.sourceforge.net/scripts/download_script.php?src_id=7701"
vim_plugin_task "vividchalk",       "http://github.com/tpope/vim-vividchalk.git"

vim_plugin_task "command_t",        "http://github.com/wincent/Command-T.git" do
  sh "find ruby -name '.gitignore' | xargs rm"
  Dir.chdir "ruby/command-t" do
    sh "rvm system ruby extconf.rb"
    sh "make clean && make"
  end
end

vim_plugin_task "railscasts-theme" do
  sh "curl http://github.com/jpo/vim-railscasts-theme/raw/master/railscasts.vim > colors/railscasts.vim"
  File.open(File.expand_path("../colors/railscasts+.vim", __FILE__), "w") do |file|
    file.puts <<-VIM.gsub(/^      /, "")
      runtime colors/railscasts.vim
      let g:colors_name = "railscasts+"

      set fillchars=vert:\\ 
      set fillchars=stl:\\ 
      set fillchars=stlnc:\\ 
      hi  StatusLine guibg=#cccccc guifg=#000000
      hi  VertSplit  guibg=#dddddd
    VIM
  end
end

vim_plugin_task "mustasche" do
  sh "curl http://github.com/defunkt/mustache/raw/master/contrib/mustache.vim > syntax/mustache.vim"
end

desc "Cleanup all the files"
task :clean do
  rm_rf "tmp"
end

desc "Update the documentation"
task :update_docs do
  puts "Updating VIM Documentation..."
  system "vim -e -s <<-EOF\n:helptags ~/.vim/doc\n:quit\nEOF"
end

desc "link vimrc to ~/.vimrc"
task :link_vimrc do
  %w[ vimrc gvimrc ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
      ln_s(File.expand_path("../#{file}", __FILE__), dest)
    end
  end
end

task :default => [
  :update_docs,
  :link_vimrc
]
