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

bindkey "^[OH" beginning-of-line # Home
bindkey "^[OF" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "^[[3~" delete-char # Del
bindkey "^[[1;5C" forward-word # Ctrl + Right
bindkey "^[[1;5D" backward-word # Ctrl + Left

export PATH="/home/luke/play-2.1.5:/home/luke/scripts:/home/luke/.cabal/bin:/home/luke/.gem/ruby/2.0.0/bin/":$PATH

HISTFILE=~/.zshhistory
HISTSIZE=5000
SAVEHIST=5000
