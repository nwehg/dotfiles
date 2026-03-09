# Pacman aliases
alias pacin="sudo pacman -S"
alias pacrem="sudo pacman -Rns"
alias pacreps="pacman -Ss"
alias pacmir="sudo pacman -Syy"
alias pac="sudo pacman"
alias pacis="sudo pacman -Sy"

# Pacman aliases
alias parin="paru -S"
alias parrem="paru -Rns"
alias parreps="paru -Ss"
alias parmir="paru Syy"
alias upgrade="paru -Syu"

# General aliases
alias ccd="cd && clear"
alias ls="lsd"
alias history="history 0"
alias s="sudo"
alias k="k -h"

# Git aliases
alias g="git"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gd="git diff"
alias gst="git status"
alias gr="git reset HEAD --hard"

# Typo aliases
alias vnim="nvim"
alias nvm="nvim"
alias nvi="nvim"
alias dc="cd"
alias sduo="sudo"
alias sodu="sudo"

# Make sure alias-tips will ignore typo aliases
export ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES="vnim nvm nvi dc sduo sodu"

# Other aliases
alias cd="z"
alias gdb="gdb -q"
