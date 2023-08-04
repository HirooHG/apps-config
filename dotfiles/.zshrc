[ $(pidof Hyprland) ] || exec dbus-launch Hyprland || exit 1

# conf
eval `ssh-agent -s`
ssh-add $HOME/.ssh/githubSsh

export DOTFILES_PATH="$HOME/apps-config/dotfiles"

# aliases and sh confs
. "$DOTFILES_PATH/.profile"
. "$DOTFILES_PATH/.aliases"

if [[ -r "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi

if [[ -r "$DOTFILES_PATH/.qiminfo" ]]; then
  . "$DOTFILES_PATH/.qiminfo"
fi
