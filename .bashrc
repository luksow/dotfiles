
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

EDITOR="emacsclient -c -n"
VISUAL="emacsclient -c -n"
alias e="emacsclient -c -n"
alias emacs-bg="emacsclient -c -n"
