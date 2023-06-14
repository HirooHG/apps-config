
# shrc for bash and zsh
#
export LANG=en_US.UTF-8
export EDITOR='nvim'
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS='@im=fcitx'
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
export EWW="$HOME/.config/hypr/eww"
export WLR_NO_HARDWARE_CURSORS=1

# user conf
export PATH="$PATH:$HOME/Dev/flutter/bin"
export PATH="$PATH:$HOME/Dev/android-studio/bin/"
export PATH="$PATH:$HOME/Dev/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/Dev/node/bin"
export PATH="$PATH:$HOME/Dev/code/bin"
export PATH="$PATH:$HOME/Android/Sdk/emulator/"
export PATH="$PATH:$HOME/Android/Sdk/cmdline-tools/latest/bin/"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools/"

# oh my zsh
export ZSH="$HOME/.zshfiles/.oh-my-zsh"
ZSH_THEME="clean"
plugins=(git)
zstyle ':omz:*' aliases no
zstyle ':omz:update' auto
source $ZSH/oh-my-zsh.sh
