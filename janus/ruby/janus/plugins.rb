require 'rake'
require 'open-uri'

module Janus
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
    raise Janus::BlockNotGivenError unless block_given?

    define_install_plugin_tasks(group, name, &block)
  end

  # Download and save file
  #
  # @param [String] url
  # @param [String] path
  def download_and_save_file(url, path)
    open_and_save_file(path, open(url).read)
  end

  # Open and save file
  #
  # @param [String] path
  # @param [Value] What to write in the file
  # @param [&block]
  def open_and_save_file(path, value = nil, &block)
    # Make sure the directory up to the folder exists
    mkdir_p File.dirname(path)
    # Open the file and use either the block or the value to write the
    # file
    File.open path, 'w' do |f|
      if block_given?
        f.write(yield)
      else
        f.write(value)
      end
    end
  end

  # Define a custom plugin
  #
  # If repo is provided, this will set up a git submodule. Otherwise it
  # will create the directory in custom.
  #
  # If a block is provided, it is yielded with the current working
  # directory set to the plugin's directory.
  #
  # @param [String] Plugin name
  # @param [String] Optional git repo path
  # @param &block
  def plugin(name, repo = nil, &block)
    plugin_dir = "#{vim_path}/custom/#{name}"

    namespace name do
      local_plugin_dir = "janus/vim/custom/#{name}"

      if repo
        # git submodule status does not exit nonzero on error
        status = `git submodule status -q #{local_plugin_dir} 2>&1`
        if status != ""
          desc "install the #{name} plugin"
          task :install do
            install_banner name
            sh "rm -rf #{plugin_dir}" if File.exist? plugin_dir
            sh "git submodule add #{repo} #{local_plugin_dir}"
            Dir.chdir(plugin_dir) { yield } if block
          end
        else
          # the submodule already exists
          task :install do
            Dir.chdir(plugin_dir) { yield } if block
          end
        end
      else
        directory plugin_dir

        desc "install the #{name} plugin"
        task :install => plugin_dir do
          install_banner name
          Dir.chdir(plugin_dir) { yield } if block
        end
      end
    end

    # Hook the plugin's install task to the global install task
    task :install => "#{name}:install"
  end

  protected

  # Define tasks for installing a plugin
  #
  # @param [String] The group the plugin belongs to
  # @param [String] The plugin name
  # @param [&block] The installation block
  def define_install_plugin_tasks(group, name, &block)
    # Create a namespace for the plugin
    namespace(name) do
      # Define the plugin installation task
      desc "Install #{name} plugin."
      task :install do
        if Dir["#{vim_path}/#{group}/#{name}/**"].any?
          install_banner name
          yield
        end
      end
    end

    # Hook the plugin's install task to the global install task
    task :install => "#{name}:install"
  end

  # Display an "installing" banner for the given plugin name
  #
  # @param [String] Plugin name
  def install_banner(name)
    puts
    puts "*" * 40
    puts "*#{"Installing #{name}".center(38)}*"
    puts "*" * 40
    puts
  end
end
