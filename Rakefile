
directory "tmp"
directory "doc"
directory "plugin"
directory "ruby"
directory "syntax"

namespace :nerdtree do
  file "tmp/nerdtree" => "tmp" do
    sh "git clone http://github.com/scrooloose/nerdtree.git tmp/nerdtree"
  end

  task :pull => "tmp/nerdtree" do
    Dir.chdir "tmp/nerdtree" do
      sh "git pull"
    end
  end

  task :install => :pull do
    Dir.chdir "tmp/nerdtree" do
      sh "rake install"
    end
  end
end

namespace :vim_javascript do
  file "tmp/vim-javascript" => "tmp" do
    sh "git clone http://github.com/pangloss/vim-javascript.git tmp/vim-javascript"
  end

  task :pull => "tmp/vim-javascript" do
    Dir.chdir "tmp/vim-javascript" do
      sh "git pull"
    end
  end

  task "install" => "pull" do
    Dir.chdir "tmp/vim-javascript" do
      sh "rake install"
    end
  end
end

namespace "ack.vim" do
  file "tmp/ack.vim" => "tmp" do
    sh "git clone http://github.com/mileszs/ack.vim.git tmp/ack.vim"
  end

  task "pull" => "tmp/ack.vim" do
    Dir.chdir "tmp/ack.vim" do
      sh "git pull"
    end
  end

  task "install" => "pull" do
    Dir.chdir "tmp/ack.vim" do
      sh "rake install"
    end
  end
end

namespace :command_t do
  file "tmp/command_t" => "tmp" do
    sh "git clone http://github.com/wincent/Command-T.git tmp/command_t"
  end

  task "pull" => "tmp/command_t" do
    Dir.chdir "tmp/command_t" do
      sh "git pull"
    end
  end

  task "copy_files" => ["doc", "plugin", "ruby", "pull"] do
    sh "cp -f  tmp/command_t/doc/*    doc/"
    sh "cp -f  tmp/command_t/plugin/* plugin/"
    sh "cp -rf tmp/command_t/ruby/*   ruby/"
    sh "find ruby -name '.gitignore' | xargs rm"
  end

  task "install" => "copy_files" do
    Dir.chdir "ruby/command-t" do
      sh "rvm system ruby extconf.rb"
      sh "make clean && make"
    end
  end
end

namespace :indent_object do
  file "tmp/indent_object" => "tmp" do
    sh "git clone http://github.com/michaeljsmith/vim-indent-object.git tmp/indent_object"
  end

  task :pull => "tmp/indent_object" do
    Dir.chdir "tmp/indent_object" do
      sh "git pull"
    end
  end

  task "install" => ["doc", "plugin", "pull"] do
    sh "cp -f tmp/indent_object/doc/* doc/"
    sh "cp -f tmp/indent_object/plugin/* plugin/"
  end
end

namespace :mustache do
  task "install" => "syntax" do
    sh "curl http://github.com/defunkt/mustache/raw/master/contrib/mustache.vim > syntax/mustache.vim"
  end
end

desc "Install the latest version of nerdtree"
task :nerdtree => "nerdtree:install"

desc "Install vim-javascript"
task "vim-javascript" => "vim_javascript:install"

desc "Install the latest version of Command-T"
task "command-t" => "command_t:install"

desc "Install the latest version of indent-object"
task "indent-object" => "indent_object:install"

desc "Install the Mustache syntax file"
task "mustache" => "mustache:install"

desc "Install ack.vim"
task "ack.vim" => "ack.vim:install"

desc "Cleanup all the files"
task :clean do
  rm_rf "tmp"
end

task "default" => [
  "nerdtree", 
  "command-t", 
  "indent-object",
  "mustache", 
  "vim-javascript",
  "ack.vim"
]
