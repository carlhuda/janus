install_vim_plugin "tools", "kvbd" do
  download_and_save_file github_raw("telamon/janus/master/plugin/kvbd.vim"),
    "vimius/vim/tools/kvbd/plugin/kvdb.vim"

  open_and_save_file "vimius/vim/tools/vimius/plugin/kvdb.vim" do
    <<-EOS
call vimius#add_mapping('kvbd', 'map', '<C-W>!', '<Plug>Kwbd')
    EOS
  end
end
