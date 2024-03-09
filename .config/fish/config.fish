# Variables
set -Ux EDITOR nvim # default editor
set -Ux XDG_CONFIG_DIRS /etc/xdg
set -Ux XDG_CONFIG_HOME $HOME/.config
set -Ux XDG_DATA_HOME $HOME/.local/share
set -Ux __fish_config_dir $XDG_CONFIG_HOME
set -U FZF_LEGACY_KEYBINDINGS 0

# alias
if type -fq exa
    alias la="exa -la"
    alias ll="exa -l"
    alias ls="exa"
else
    alias la="ls -la"
    alias la="ls -l"
    alias la="ls"
end

fish_add_path $HOME/.local/bin

# bash source
bass source $HOME/.cargo/env
bass source /opt/alacritty/extra/completions/alacritty.bash

# starship
starship init fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/sky/.ghcup/bin # ghcup-env
