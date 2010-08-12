module VIM
  Dirs = %w[ autoload doc plugin ruby syntax ftdetect ftplugin colors indent ]
end

directory "tmp"
VIM::Dirs.each do |dir|
  directory(dir)
end

def vim_plugin_task(name, repo=nil)
  cwd = File.expand_path("../", __FILE__)
  dir = File.expand_path("tmp/#{name}")
  subdirs = VIM::Dirs

  namespace(name) do
    if repo
      file dir => "tmp" do
        if repo =~ /git$/
          sh "git clone #{repo} #{dir}"

        elsif repo =~ /download_script/ # TODO: this assumes all vimscripts downloads are zips (can be vba or targz)
          sh "curl #{repo} > #{dir}.zip"
          sh "unzip -o #{dir}.zip -d #{dir}"

        elsif repo =~ /tar\.gz$/
          filename = File.basename(repo)
          dirname  = File.basename(filename, '.tar.gz')

          sh "curl #{repo} > tmp/#{filename}"
          sh "tar zxvf tmp/#{filename}"
          sh "mv #{dirname} #{dir}"

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
vim_plugin_task "conque",           "http://conque.googlecode.com/files/conque_1.1.tar.gz"
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
vim_plugin_task "supertab",         "http://github.com/ervandew/supertab.git"

vim_plugin_task "command_t",        "http://github.com/wincent/Command-T.git" do
  sh "find ruby -name '.gitignore' | xargs rm"
  Dir.chdir "ruby/command-t" do
    if `rvm > /dev/null 2>&1` && $?.exitstatus == 1
      sh "rvm system ruby extconf.rb"
    else
      sh "/usr/bin/ruby extconf.rb" # assume /usr/bin/ruby is system ruby
    end
    sh "make clean && make"
  end
end

vim_plugin_task "janus_themes" do
  # custom version of railscasts theme
  File.open(File.expand_path("../colors/railscasts+.vim", __FILE__), "w") do |file|
    file.puts <<-VIM.gsub(/^ +/, "").gsub("<SP>", " ")
      runtime colors/railscasts.vim
      let g:colors_name = "railscasts+"

      set fillchars=vert:\\<SP>
      set fillchars=stl:\\<SP>
      set fillchars=stlnc:\\<SP>
      hi  StatusLine guibg=#cccccc guifg=#000000
      hi  VertSplit  guibg=#dddddd
    VIM
  end

  # custom version of jellybeans theme
  File.open(File.expand_path("../colors/jellybeans+.vim", __FILE__), "w") do |file|
    file.puts <<-VIM.gsub(/^      /, "")
      runtime colors/jellybeans.vim
      let g:colors_name = "jellybeans+"

      hi  VertSplit    guibg=#888888
      hi  StatusLine   guibg=#cccccc guifg=#000000
      hi  StatusLineNC guibg=#888888 guifg=#000000
    VIM
  end
end

vim_plugin_task "molokai" do
  sh "curl http://www.vim.org/scripts/download_script.php?src_id=9750 > colors/molokai.vim"
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
