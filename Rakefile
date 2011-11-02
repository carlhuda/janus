def expand(file)
  File.expand_path(file)
end

task expand("~/.vimrc") => "vimrc" do
  sh "ln -s ~/.vim/vimrc ~/.vimrc"
end

# Get a list of submodules
#
# @return [Array] of submodules
def submodules
  `git submodule`.split("\n").collect { |s| s.split(" ")[1] }
end

# Update a submodule
#
# @param [String] The submodule to update (relative path)
# @param [String] The branch we're tracking
def update_submodule(submodule, branch = "master")
  Dir.chdir submodule do
    puts
    puts "*" * 40
    puts "*#{"Updating #{submodule}".center(38)}*"
    puts "*" * 40
    puts
    sh "git checkout #{branch}"
    sh "git pull"
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

task expand("~/.gvimrc") => "gvimrc" do
  sh "ln -s ~/.vim/gvimrc ~/.gvimrc"
end

task :update do
  sh "git pull"
  sh "git submodule init"
  sh "git submodule update"
end

task :default => [:update, expand("~/.vimrc"), expand("~/.gvimrc")]
