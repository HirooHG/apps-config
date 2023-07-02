[ $(pidof Hyprland) ] || exec dbus-launch Hyprland

# conf
eval `ssh-agent -s`
ssh-add $HOME/.ssh/githubSsh

# aliases and sh confs
. "$HOME/.profile"
. "$HOME/.aliases"
. "$HOME/.cargo/env"
