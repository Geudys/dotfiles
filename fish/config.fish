# ~/.config/fish/config.fish

# ================================
#   Tema tipo Night Owl (mejorado)
# ================================

# Colores principales
set -g fish_color_normal d6deeb
set -g fish_color_autosuggestion 7a8181
set -g fish_color_command 82aaff
set -g fish_color_error ff5370 --bold
set -g fish_color_param c792ea
set -g fish_color_comment 5f7e97
set -g fish_color_match --background=44475a
set -g fish_color_selection white --bold --background=285577
set -g fish_color_search_match ffc777 --background=44475a
set -g fish_color_history_current --bold
set -g fish_color_operator 89ddff
set -g fish_color_escape 89ddff
set -g fish_color_cwd ffb86c --bold
set -g fish_color_cwd_root ff5555 --bold
set -g fish_color_valid_path --underline
set -g fish_color_redirection ffb86c
set -g fish_color_end 82aaff
set -g fish_color_quote ffb86c
set -g fish_color_cancel -r

# Prompt user/host/status
set -g fish_color_user 82aaff --bold
set -g fish_color_host ffd866
set -g fish_color_status ff5555 --bold

# Colores del sistema de completado
set -g fish_pager_color_completion d6deeb
set -g fish_pager_color_description 7a8181
set -g fish_pager_color_prefix 82aaff --bold
set -g fish_pager_color_progress white --background=285577

# ================================
#   Prompt personalizado con Git + Nerd Fonts
# ================================

function __git_info
    if not command -v git >/dev/null
        return
    end

    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set branch (git branch --show-current 2>/dev/null; or echo " detached")

        set symbols ""
        if not git diff --quiet --ignore-submodules --cached
            set symbols "$symbols " # staged
        end
        if not git diff --quiet --ignore-submodules
            set symbols "$symbols 󰛿" # unstaged
        end
        if git ls-files --others --exclude-standard | grep -q .
            set symbols "$symbols " # untracked
        end

        echo " $branch$symbols"
    end
end

function fish_prompt

    set_color 89ddff
    echo -n "   "
    set_color normal

    set_color c792ea
    echo -n (prompt_pwd)

    # Git info
    set gitinfo (__git_info)
    if test -n "$gitinfo "
        set_color ffb86c
        echo -n " $gitinfo "
    end
    set_color 89ddff
    echo -n " "
    set_color normal
end

# ================================
#   Título de ventana
# ================================
function fish_title
    echo (status current-command) "  " (prompt_pwd)
end

# ================================
#   Mensaje de bienvenida
# ================================
function fish_greeting
    set_color 82aaff
    echo ""
    set_color 7a8181
end

# ================================
#   Aliases útiles
# ================================

alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias za='eza -a --icons --group-directories-first --color=always'
alias z='eza --icons --group-directories-first --color=always'
alias zl='eza -l --icons --group-directories-first --color=always'
alias zla='eza -la --icons --group-directories-first --color=always'
alias zt='eza -T --icons --group-directories-first --color=always'
alias zta='eza -Ta --icons --group-directories-first --color=always'
alias zlt='eza -lT --icons --group-directories-first --color=always'

# Aliases personalizados
alias n="nvim"
alias lg="lazygit"
alias gs="git status"
alias gc="git commit -m"
alias gp="git push"
alias ga="git add ."
alias ..="cd .."
alias ...="cd ../.."

# tmux
alias t='tmux attach || tmux new'
alias tk='tmux kill-session -t'
alias tl='tmux list-sessions'
alias tn='tmux new -s'

# ================================
#   Rutas adicionales
# ================================
if test -d /home/linuxbrew/.linuxbrew/bin
    set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
end

# ================================
#  Extra 
# ================================

# Iniciar tmux automáticamente si no está corriendo
if status is-interactive
    and not set -q TMUX
    tmux attach || tmux new
end

# Sincronizar ruta con yazi
set -gx EDITOR nvim
set -gx VISUAL nvim

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Sincronizar Superfile
function s
    set os $(uname -s)

    if test "$os" = "Linux"
        set spf_last_dir "$HOME/.local/state/superfile/lastdir"
    end

    if test "$os" = "Darwin"
        set spf_last_dir "$HOME/Library/Application Support/superfile/lastdir"
    end

    command spf $argv

    if test -f "$spf_last_dir"
        source "$spf_last_dir"
        rm -f -- "$spf_last_dir" >> /dev/null
    end
end
set -gx PATH $PATH ./node_modules/.bin
