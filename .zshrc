
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/space/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
setopt autocd beep extendedglob nomatch notify
# End of lines configured by zsh-newuser-install

# Enable Starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# A bunch of custom aliases for easier terminal usage.
alias ll="exa --long --all --classify --icons --git --ignore-glob='.git'"
alias dcp="docker-compose"
alias loc="wc -l"
alias mkvenv="python -m venv .venv"
alias update="sudo apt-get update && sudo apt-get upgrade -y && brew update && brew upgrade && brew autoremove"
alias tree="exa --tree --all --icons --ignore-glob='.git' --git-ignore"

# Plugin for syntax highlighting when using Zsh as a login shell. For more info,
# refer to the docs at: https://github.com/zsh-users/zsh-syntax-highlighting
source "${ZDOTDIR:-$HOME}/.local/share/zsh/plugins/zsh-syntax-highlighting.zsh"

# NOTE: On Kitty, the escape codes could be different.
# Move to the end of the line when pressing the "End" key
bindkey "^[[4~" end-of-line
# Move to the start of the line when pressing the "Home" key
bindkey "^[[1~" beginning-of-line
