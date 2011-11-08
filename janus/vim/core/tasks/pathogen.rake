install_vim_plugin "core", "pathogen" do
  unless File.exists?("#{root_path}/autoload/pathogen.vim")
    mkdir_p "autoload"
    ln_s "#{vim_path}/core/pathogen/autoload/pathogen.vim", "#{root_path}/autoload/pathogen.vim"
  end
end
