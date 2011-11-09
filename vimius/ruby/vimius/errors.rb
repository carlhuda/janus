module Vimius
  # Errors
  VimiusError = Class.new Exception
  BlockNotGivenError = Class.new VimiusError
  RubyGemsNotFoundError = Class.new VimiusError
end
