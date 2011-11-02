namespace :plugins do
  desc "Install the hammer plugin."
  task :install_hammer do
    begin
      require 'rubygems'
      if Gem.cache.find_name('github-markup').length == 0
        sh "gem install github-markup"
      end
      if Gem.cache.find_name('redcarpet').length == 0
        sh "gem install redcarpet"
      end
    rescue LoadError
      puts "Could not install github-markup and redcarpet, please install them manually."
      puts "gem install github-markup redcarpet"
    end
  end

  task :install => :install_hammer
end
