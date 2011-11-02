namespace :plugins do
  desc "Install the hammer plugin."
  task :install_hammer do
    begin
      if find_gem('github-markup').length == 0
        sh "gem install github-markup"
      end
      if find_gem('redcarpet').length == 0
        sh "gem install redcarpet"
      end
    rescue Janus::RubyGemsNotFoundError
      puts "Could not install github-markup and redcarpet, please install them manually."
      puts "gem install github-markup redcarpet"
    end
  end

  task :install => :install_hammer
end
