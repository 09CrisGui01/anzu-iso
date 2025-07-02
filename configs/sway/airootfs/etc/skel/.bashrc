[[ $- != *i* ]] && return

[[ -d "$HOME/.bin" ]] && export PATH="$HOME/.bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

bind "set completion-ignore-case on"

[[ -r ~/.bash_env ]] && . ~/.bash_env
[[ -r ~/.bash_aliases ]] && . ~/.bash_aliases
