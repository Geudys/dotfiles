# Theme

## colors
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

set -g fish_color_user 82aaff --bold
set -g fish_color_host ffd866
set -g fish_color_status ff5555 --bold

set -g fish_pager_color_completion d6deeb
set -g fish_pager_color_description 7a8181
set -g fish_pager_color_prefix 82aaff --bold
set -g fish_pager_color_progress white --background=285577

# Git
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

    set gitinfo (__git_info)
    if test -n "$gitinfo "
        set_color ffb86c
        echo -n " $gitinfo "
    end
    set_color 89ddff
    echo -n " "
    set_color normal
end

# Window title
function fish_title
    echo (status current-command) "  " (prompt_pwd)
end

# Welcome message
function fish_greeting
    set_color 82aaff
    set_color 7a8181
end
