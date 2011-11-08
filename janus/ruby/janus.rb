module Janus
  # Return the root path
  #
  # @return [String] The absolute path to Janus repository
  def root_path
    ROOT_PATH
  end

  # Return the vim's path
  #
  # @return [String] The absolute path to ViM files
  def vim_path
    File.join ROOT_PATH, 'vim'
  end

  # Return the ruby's path
  #
  # @return [String] The absolute path to Ruby files
  def ruby_path
    File.join ROOT_PATH, 'ruby'
  end

  # Expand the path of a given file
  #
  # @param [Array] args
  # @return [String] The expanded path to the given file.
  def expand(*args)
    File.expand_path(*args)
  end
end

require 'janus/errors'
require 'janus/git'
require 'janus/vim'
require 'janus/gems'
require 'janus/plugins'
