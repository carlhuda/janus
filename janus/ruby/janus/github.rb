module Janus

  # Return a fully-qualified url to the raw page of a file stores inside
  # a repository on github
  #
  # @param [String] Path
  # @return [String] URL
  def github_raw(path)
    "https://raw.github.com/#{path}"
  end
end
