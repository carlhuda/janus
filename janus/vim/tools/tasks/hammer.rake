install_vim_plugin "tools", "hammer" do |module_loaded|
  install_gem 'github-markup' if module_loaded
  install_gem 'redcarpet'     if module_loaded
end
