# layout (night owl, fish faithful)

# git info
__git_info() {
  command -v git >/dev/null 2>&1 || return
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return

  local branch symbols=""

  branch=$(git branch --show-current 2>/dev/null)
  [[ -z "$branch" ]] && branch=" detached"

  git diff --quiet --ignore-submodules --cached || symbols+=" "
  git diff --quiet --ignore-submodules || symbols+=" 󰛿"
  git ls-files --others --exclude-standard 2>/dev/null | grep -q . && symbols+=" "

  echo " $branch$symbols"
}

# prompt
__build_prompt() {
  local gitinfo
  gitinfo="$(__git_info)"

  PROMPT="  %F{#89ddff} %f"
  PROMPT+="%F{#c792ea}%~%f"

  if [[ -n "$gitinfo" ]]; then
    PROMPT+=" %F{#ffb86c}${gitinfo}%f"
  fi

  PROMPT+=" %F{#89ddff} %f"
}

precmd() {
  __build_prompt
}

# window title
__set_title() {
  print -Pn "\e]0;%~\a"
}

precmd_functions+=(__set_title)

