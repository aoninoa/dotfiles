#!/usr/bin/env bash

set -euo pipefail

config_dir="$HOME/.config"

mkdir -p $config_dir

err() { 
    echo "$@" 1>&2;
} 

# setup window manger
if [ -x "$(command -v i3)" ]; then
    cp -r -t $config_dir/ ./.config/i3
else
    err "There is no installation of i3"
fi

# setup status bar
if [ -x "$(command -v i3blocks)" ]; then
    cp -r -t $config_dir/ ./.config/i3blocks
    for script in $config_dir/i3blocks/scripts/*; do
        chmod +x $script
    done
else
    err "There is no installation of i3blocks"
fi

# setup notification
if [ -x "$(command -v dunst)" ]; then
    cp -r -t $config_dir/ ./.config/dunst
else
    err "There is no installation of dunst"
fi

# setup fish shell
if [ -x "$(command -v fish)" ]; then
    if [ -d $config_dir/fish ]; then
        mkdir -p $config_dir/fish/functions
        cp -t $config_dir/fish              ./.config/fish/config.fish
        cp -t $config_dir/fish/functions    ./.config/fish/functions/fish_greeting.fish
    else
        cp -r -t $config_dir/ ./.config/fish
    fi
    # prompt
    cp -t $config_dir/ ./.config/starship.toml
    # install plugin manager
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
else
    err "There is no installation of fish"
fi

# setup terminal
if [ -x "$(command -v alacritty)" ]; then
    cp -r -t $config_dir/ ./.config/alacritty
else
    err "There is no installation of alacritty"
fi

# setup terminal multiplexer
if [ -x "$(command -v tmux)" ]; then
    cp -t $HOME/ ./.tmux.conf
    mkdir -p $HOME/.tmux/plugins/tpm
    # install plugin manager
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    err "There is no installation of tmux"
fi

# setup text editor
if [ -x "$(command -v nvim)" ]; then
    cp -r -t $config_dir/ ./.config/nvim
else
    err "There is no installation of nvim"
fi

