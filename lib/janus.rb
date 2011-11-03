module Janus
  # Return the root path
  #
  # @return [String] The absolute path to Janus repository
  def root_path
    ROOT_PATH
  end

  # Expand the path of a given file
  #
  # @param [String] file
  # @return [String] The expanded path to the given file.
  def expand(file)
    File.expand_path(file)
  end
end

require 'janus/errors'
require 'janus/git'
require 'janus/vim'
require 'janus/gems'
require 'janus/plugins'
