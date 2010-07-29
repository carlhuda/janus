
directory "tmp"

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

desc "Install the latest version of nerdtree"
task :nerdtree => "nerdtree:install"

desc "Cleanup all the files"
task :clean do
  rm_rf "tmp"
end
