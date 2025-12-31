# Night Owl color palette

# reset
RESET='%f%k'


# foreground
export NO_FG_DEFAULT='%F{#d6deeb}'
export NO_FG_MUTED='%F{#7a8181}'
export NO_FG_DIM='%F{#5f7e97}'


# core colors
export NO_BLUE='%F{#82aaff}'
export NO_CYAN='%F{#89ddff}'
export NO_GREEN='%F{#addb67}'
export NO_YELLOW='%F{#ecc48d}'
export NO_ORANGE='%F{#ffb86c}'
export NO_RED='%F{#ff5370}'
export NO_PURPLE='%F{#c792ea}'
export NO_PINK='%F{#ff5874}'


# backgrounds
export NO_BG_DEFAULT='%K{#011627}'
export NO_BG_ALT='%K{#011c33}'


# ui / accents
export NO_BORDER='%F{#1d3b53}'
export NO_HIGHLIGHT='%F{#5f7e97}'
export NO_INFO='%F{#89ddff}'
export NO_WARN='%F{#ecc48d}'
export NO_ERROR='%F{#ff5370}'


# selection / match
export NO_MATCH_BG='%K{#44475a}'
export NO_SELECTION_BG='%K{#285577}'
export NO_SEARCH_FG='%F{#ffc777}'


# helpers
color() {
  local color="$1"
  shift
  print -P "${(P)color}$*${RESET}"
}

# Syntax Highlighting
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]='fg=#82aaff'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#82aaff'
ZSH_HIGHLIGHT_STYLES[function]='fg=#82aaff'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#82aaff,italic'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#82aaff'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#82aaff'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#c792ea'
ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=#82aaff'

ZSH_HIGHLIGHT_STYLES[path]='fg=#addb67'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#addb67,bold'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#addb67'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#addb67'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=#addb67,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#f78c6c,bold'

ZSH_HIGHLIGHT_STYLES[alias]='fg=#c792ea'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#c792ea,underline'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#c792ea,bold'
ZSH_HIGHLIGHT_STYLES[variable]='fg=#f78c6c'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#f78c6c'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#f78c6c'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#f78c6c'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#f78c6c'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#f78c6c'

ZSH_HIGHLIGHT_STYLES[argument]='fg=#d6deeb'
ZSH_HIGHLIGHT_STYLES[string]='fg=#ecc48d'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#ecc48d'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#ecc48d'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#c792ea'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#c792ea'
ZSH_HIGHLIGHT_STYLES[option]='fg=#c792ea'

ZSH_HIGHLIGHT_STYLES[comment]='fg=#637777,italic'

ZSH_HIGHLIGHT_STYLES[redirection]='fg=#c792ea,bold'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#f78c6c'

ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#c792ea,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#c792ea'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#c792ea'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#ef5350'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#ef5350'

ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=#82aaff,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=#c792ea,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=#f78c6c,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=#addb67,bold'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=#ffffff,bg=#4a5568,bold'

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ef5350,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#c792ea'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#addb67,italic'

ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=#82aaff'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#c792ea'

ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#82aaff,bold'

ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#f78c6c'

ZSH_HIGHLIGHT_STYLES[arg0]='fg=#82aaff'
