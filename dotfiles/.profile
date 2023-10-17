
export PROFILE_PATH="$APPCONFIG_PATH/dotfiles/profile"

# shrc for bash and zsh
# gen
export LANG=en_US.UTF-8
export EDITOR='nvim'
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
export EWW="$HOME/.config/hypr/eww"
export WLR_NO_HARDWARE_CURSORS=1
export GPG_TTY=$(tty)

if [[ -r "$PROFILE_PATH/.path" ]]; then
  . "$PROFILE_PATH/.path"
fi

if [[ -r "$PROFILE_PATH/.fcitx5" ]]; then
  . "$PROFILE_PATH/.fcitx5"
fi
