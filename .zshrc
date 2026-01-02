# ~/.zshrc

# for flutter development
echo 'export PATH="$HOME/Downloads/flutter/bin:$PATH"' >> ~/.zshenv

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
