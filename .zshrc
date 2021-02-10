autoload -U compinit promptinit
compinit
promptinit
autoload -U colors && colors
PROMPT="[%n@%M %1~]$ "
RPROMPT="%{$fg[green]%}%d%{$reset_color%}"
zstyle ':completion:*' menu select

alias ls='ls --color=auto'
alias e='f emacs'
alias enw='emacs -nw'
alias sbt='source .env; sbt'

bindkey "^[[H" beginning-of-line # Home
bindkey "^[[F" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "^[[3~" delete-char # Del
bindkey "^[[1;5C" forward-word # Ctrl + Right
bindkey "^[[1;5D" backward-word # Ctrl + Left

export PATH="/home/luke/scripts:/home/luke/.bloop":$PATH

HISTFILE=~/.zshhistory
HISTSIZE=5000
SAVEHIST=5000

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

autoload -U compinit
fpath=($HOME/.bloop/zsh $fpath)
compinit
