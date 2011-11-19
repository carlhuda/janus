install_vim_plugin_within_submodule "tools", "command-t" do
  Dir.chdir "#{vim_path}/tools/command-t/ruby/command-t" do
    sh "ruby extconf.rb"
    sh "make clean && make"
  end
end
