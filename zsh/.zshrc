# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt inc_append_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

# behavior
setopt auto_cd
setopt interactive_comments
setopt no_nomatch

# editor
export EDITOR=nvim
export VISUAL=nvim

# completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# modules
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/colors.zsh"
source "$ZDOTDIR/layout.zsh"
source "$ZDOTDIR/functions.zsh"

# Autosuggestions 
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Syntax highlighting 
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Content ~/.zshrc
# export ZDOTDIR="$HOME/.config/zsh"
#
# if [[ -f "$ZDOTDIR/zshrc" ]]; then
#   source "$ZDOTDIR/zshrc"
# fi
#
