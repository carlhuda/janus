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
# @param [Mixed] The gem requirements
# @return [Array] The found gems
def find_gem(gem_name, *requirements)
  begin
    require 'rubygems'
    if Gem.const_defined?(:Specification)
      Gem::Specification.find_all_by_name(gem_name, *requirements)
    elsif Gem.respond_to?(:source_index)
      Gem.source_index.find_name(gem_name, *requirements)
    else
      Gem.cache.find_name(gem_name, *requirements)
    end
  rescue LoadError
    raise Janus::RubyGemsNotFoundError
  end
end

# Install a gem
#
# @param [String] The gem name
def install_gem(gem_name)
  require 'rubygems'

  # Install the gem only if it can't be found
  if find_gem(gem_name).length == 0
    sh "gem install #{gem_name}"
  end
rescue Janus::RubyGemsNotFoundError
  puts "Could not install the gem #{gem_name}, please do so manually."
  puts "gem install #{gem_name}"
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
