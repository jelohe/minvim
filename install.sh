sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \

sh -c 'curl -o ~/.config/nvim/init.lua --create-dirs \
    https://raw.githubusercontent.com/jelohe/minvim/refs/heads/main/init.lua'

nvim +PlugInstall +qa
