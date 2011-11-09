require 'rake'
module Vimius
  include Rake::DSL
  
  def self.included(base)
    # Load all plugin installation tasks
    Dir["#{vim_path}/*/tasks/**.rake"].each do |f|
      base.send :import, f
    end
  end

  # Install a plugin
  #
  # @param [String] The group the plugin belongs to
  # @param [String] The plugin name
  # @param [&block] The installation block
  def install_vim_plugin(group, name, &block)
    raise Vimius::BlockNotGivenError unless block_given?

    # Create a namespace for the plugin
    namespace(name) do
      task :verify_plugin do
        unless Dir["#{vim_path}/#{group}/#{name}/**"].any?
          abort "The submodule #{group}/#{name} is not ready, please run 'git submodule update --init'"
        end
      end

      # Define the plugin installation task
      desc "Install #{name} plugin."
      task :install do
        puts
        puts "*" * 40
        puts "*#{"Installing #{name}".center(38)}*"
        puts "*" * 40
        puts
        yield
      end
      task :install => :verify_plugin
    end

    # Hook the plugin's install task to the global install task
    task :install => "#{name}:install"
  end
end
