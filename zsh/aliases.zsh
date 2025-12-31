# Core utils
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'


# Eza
alias za='eza -a --icons --group-directories-first'
alias z='eza --icons --group-directories-first'
alias zl='eza -l --icons --group-directories-first'
alias zla='eza -la --icons --group-directories-first'
alias zt='eza -T --icons --group-directories-first'
alias zta='eza -Ta --icons --group-directories-first'
alias zlt='eza -lT --icons --group-directories-first'

# Neovim
alias n='nvim'

# Git
alias lg='lazygit'
alias gs='git status'
alias gp='git push'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

# tmux
alias t='tmux attach || tmux new'
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t'
