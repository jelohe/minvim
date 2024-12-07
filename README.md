# MINVIM

### Dependencies

##### Ensure you have `fzf` `curl` `nvim` and `rg`.
* Mac 
`brew install fzf curl nvim rg`

* Linux 
`apt-get install fzf curl nvim rg`

### Install
* Run this magic command
  ```
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
  && curl -o ~/.config/nvim/init.lua --create-dirs \
  https://raw.githubusercontent.com/jelohe/minvim/refs/heads/main/init.lua
  ```

## 🚀 Go code
