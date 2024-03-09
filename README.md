## Requirements
- i3blocks
- tmux
- nvim >=0.90
- Alacritty
- Git
- npm latest # for nvim lsp 
<<<<<<< HEAD
- python3-venv # for clang-format
=======
- python3-venv # for clang-format 
>>>>>>> 7e9f793e474e9bf37510c002ac7ee76b5b4220a0
- rofi
- fish
- starship

## Install Fisher
```
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```
### Fish Plugins
1. bass
2. z
3. ghq
4. fzf

## Set default shell
```
sudo echo /usr/bin/fish >> /etc/shells
sudo chsh -s /usr/bin/fish
```

## Install tpm
```
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
 ```
