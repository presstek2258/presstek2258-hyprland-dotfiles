# ~/.zshrc

# starts starship and zoxide
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# start zsh-syntax-highlighting and zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# sets brave as default browser for jupyter lab
export BROWSER=brave jupyter lab

