install_vim_plugin "janus-core", "pathogen" do
  unless File.exists?("autoload/pathogen.vim")
    mkdir_p "autoload"
    ln_s "../janus-core/pathogen/autoload/pathogen.vim", "autoload/pathogen.vim"
  end
end
