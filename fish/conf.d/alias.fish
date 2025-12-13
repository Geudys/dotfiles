# Alias
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Eza
alias za='eza -a --icons --group-directories-first --color=always'
alias z='eza --icons --group-directories-first --color=always'
alias zl='eza -l --icons --group-directories-first --color=always'
alias zla='eza -la --icons --group-directories-first --color=always'
alias zt='eza -T --icons --group-directories-first --color=always'
alias zta='eza -Ta --icons --group-directories-first --color=always'
alias zlt='eza -lT --icons --group-directories-first --color=always'

# Neovim
alias n="nvim"

# Git
alias lg="lazygit"
alias gs="git status"
alias gc="git commit -m"
alias gp="git push"
alias ga="git add ."

# path
alias ..="cd .."
alias ...="cd ../.."

# tmux
alias t='tmux attach || tmux new'
alias tk='tmux kill-session -t'
alias tl='tmux list-sessions'
alias tn='tmux new -s'
