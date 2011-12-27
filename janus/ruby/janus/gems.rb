module Janus
  # Find an installed gem
  #
  # @param [String] The gem name to search for
  # @param [Mixed] The gem requirements
  # @return [Array] The found gems
  def find_gem(gem_name, *requirements)
    begin
      require 'rubygems'
      if Gem.const_defined?(:Specification) && Gem::Specification.respond_to?(:find_all_by_name)
        Gem::Specification.find_all_by_name(gem_name, *requirements)
      elsif Gem.respond_to?(:source_index)
        Gem.source_index.find_name(gem_name, *requirements)
      else
        Gem.cache.find_name(gem_name, *requirements)
      end
    rescue LoadError
      raise RubyGemsNotFoundError
    end
  end

  # Install a gem
  #
  # @param [String] The gem name
  def install_gem(gem_name)
    require 'rubygems'

    # Install the gem only if it can't be found
    if find_gem(gem_name).length == 0
      sudo "gem install #{gem_name}"
    end
  rescue RubyGemsNotFoundError
    puts "Could not install the gem #{gem_name}, please do so manually."
    puts "sudo gem install #{gem_name}"
  end
end
