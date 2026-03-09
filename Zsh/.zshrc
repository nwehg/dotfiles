export PATH=/usr/local/bin:$PATH

export PATH=$PATH:/home/nico/.cargo/bin

export PATH=$PATH:/home/nico/.local/share/gem/ruby/3.0.0/bin

export PATH=$PATH:/home/nico/go/bin

export GPG_TTY=$(tty)

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

# Configure fzf-tab options
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':completion*:descriptions' format '[%d]'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload -Uz compinit
compinit -D

eval "$(zoxide init zsh)"

# Load plugins
source ~/.config/zsh/plugins/k/k.sh
source ~/.config/zsh/plugins/alias-tips/alias-tips.plugin.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-sudo/zsh-sudo.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.config/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

ZVM_CURSOR_STYLE_ENABLED=false

export EDITOR='nvim'

precmd() {
  print -Pn "\e]0; %~\a"
}

bindkey "^[[3~" delete-char

# Intialize starship
export STARSHIP_CONFIG=~/.config/zsh/starship.toml
eval "$(starship init zsh)"

# autoload -Uz vcs_info
# zstyle ":vcs_info:*" enable git
# zstyle ":vcs_info:git*" formats "  %b %m %u %c (%a)"
# zstyle ":vcs_info:*" check-for-changes true
# zstyle ":vcs_info:*" stagedstr " +"
# zstyle ":vcs_info:*" unstagedstr " !"

# precmd() {
	# vcs_info
	# print -P "%F{#a3aed2}░▒▓%F{}%K{#a3aed2} %~%F{#a3aed2}%K{#769ff0}%F{#FFFFFF}${vcs_info_msg_0_}%F{#769ff0}%K{}"
	# PROMPT="❯ "
# }

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/nico/go/bin/gocomplete go
