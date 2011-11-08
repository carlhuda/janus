install_vim_plugin "core", "pathogen" do
  unless File.exists?("autoload/pathogen.vim")
    mkdir_p "autoload"
    ln_s "#{root_path}/core/pathogen/autoload/pathogen.vim", "autoload/pathogen.vim"
  end
end
