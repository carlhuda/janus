module Janus
  # Errors
  JanusError = Class.new Exception
  BlockNotGivenError = Class.new JanusError
  RubyGemsNotFoundError = Class.new JanusError
end
