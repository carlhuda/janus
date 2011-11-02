namespace :plugins do
  desc "Install the command-t plugin."
  task :install_command_t do
    if File.exists?("#{root_path}/janus-tools/command-t/ruby/command-t")
      Dir.chdir "#{root_path}/janus-tools/command-t/ruby/command-t" do
        if File.exists?("/usr/bin/ruby1.8") # prefer 1.8 on *.deb systems
          sh "/usr/bin/ruby1.8 extconf.rb"
        elsif File.exists?("/usr/bin/ruby") # prefer system rubies
          sh "/usr/bin/ruby extconf.rb"
        elsif `rvm > /dev/null 2>&1` && $?.exitstatus == 0
          sh "rvm system ruby extconf.rb"
        end
        sh "make clean && make"
      end
    else
      abort "The submodule is not ready, please run 'git submodule update --init'"
    end
  end

  task :install => :install_command_t
end
