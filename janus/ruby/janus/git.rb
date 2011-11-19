module Janus
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
end
