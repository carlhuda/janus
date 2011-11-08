install_vim_plugin "tools", "command-t" do
  Dir.chdir "#{vim_path}/tools/command-t/ruby/command-t" do
    sh "ruby extconf.rb"
    sh "make clean && make"
  end
end
