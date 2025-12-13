# execute tmux
if status is-interactive
    and not set -q TMUX
    tmux attach || tmux new
end
