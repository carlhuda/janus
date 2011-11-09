install_vim_plugin "tools", "watchtower" do
  require 'open-uri'
  mkdir_p "vimius/vim/tools/watchtower/autoload"
  File.open "vimius/vim/tools/watchtower/autoload/watchtower.vim", 'w' do |f|
    f.write(open("https://github.com/TechnoGate/watch_tower/raw/master/lib/watch_tower/editor/extensions/watchtower.vim").read)
  end
end
