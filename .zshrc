# ~/.zshrc

# Prevent PATH duplication in nested shells (tmux, neovim)
typeset -U PATH path

# for flutter development
export PATH="$HOME/Downloads/flutter/bin:$PATH"

# android emulator path
alias emulator="~/Android/Sdk/emulator/emulator"

# starts starship and zoxide
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# start zsh-syntax-highlighting and zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# sets brave as default browser for jupyter lab
export BROWSER=brave jupyter lab

# lets jenv use the path to set specific java versions within folders
eval "$(jenv init -)"

# opencode
export PATH=/home/adrian/.opencode/bin:$PATH

# enable the usage of pcloud command
alias pcloud="~/Downloads/pcloud"

# enter python virutal environment with command
alias venv="source ~/venv/bin/activate"

# vim-gnupg path setup
export GPG_TTY=$(tty)

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/adrian/.dart-cli-completion/zsh-config.zsh ]] && . /home/adrian/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# fliirebase flutterfire cli
export PATH="$PATH":"$HOME/.pub-cache/bin"
