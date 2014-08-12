function peco-select-gitadd() {
    local selected_file_to_add=$(git status --porcelain | \
        peco --query "$LBUFFER" | \
        awk -F ' ' '{print $NF}')
    if [ -n "$selected_file_to_add" ]; then
      BUFFER="git add ${selected_file_to_add}"
      CURSOR=$#BUFFER
      zle accept-line
    fi
    zle clear-screen
}
zle -N peco-select-gitadd
bindkey "^g^a" peco-select-gitadd
