module Janus
  # Errors
  JanusError = Class.new Exception
  RubyGemsNotFoundError = Class.new JanusError
end

def expand(file)
  File.expand_path(file)
end

# Find an installed gem
#
# @param [String] The gem name to search for
# @return [Array] The found gems
def find_gem(gem_name)
  begin
    require 'rubygems'
    if Gem.respond_to?(:source_index)
      Gem.source_index.find_name(gem_name)
    else
      Gem.cache.find_name(gem_name)
    end
  rescue LoadError
    raise Janus::RubyGemsNotFoundError
  end
end

task expand("~/.vimrc") => "vimrc" do
  sh "ln -s ~/.vim/vimrc ~/.vimrc"
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
