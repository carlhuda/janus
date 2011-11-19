install_vim_plugin "tools", "watchtower" do
  download_and_save_file github_raw("TechnoGate/watch_tower/master/lib/watch_tower/editor/extensions/watchtower.vim"),
    "janus/vim/tools/watchtower/autoload/watchtower.vim"
end
