# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=9999
SAVEHIST=9999
bindkey -v
bindkey '^R' history-incremental-search-backward

# setting for peco
for f (~/.zsh/peco-sources/*) source "${f}" # load peco sources
bindkey '^r' peco-select-history

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

# autoload
autoload -Uz compinit && compinit -u
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz colors && colors


# End of lines added by compinstall

##### my settings
export SHELL=/bin/zsh
export TMPDIR=/tmp
export PAGER=less
export PATH=$HOME/.cabal/bin:$HOME/bin:$PATH:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin
export LANG=ja_JP.UTF-8
export LSCOLORS=exfxcxdxbxegedabagacad
export JSTESTDRIVER_HOME=$HOME/bin

# git editor
export GIT_EDITOR="nvim"

# when use "cd", pushd automatically
setopt auto_pushd

# packed auto completion list
setopt list_packed

# set Tab,Ctrl+I as completion key
setopt auto_menu

# auto completin (,{,[
setopt auto_param_keys

# set "/" last directory name
setopt auto_param_slash

# not set just before command in history
setopt hist_ignore_dups

# not set "history" command in history
setopt hist_no_store

# can complement after "=" (like --prefix= )
setopt magic_equal_subst


setopt mark_dirs

# enable to display Japanese file name
setopt print_eight_bit

setopt prompt_subst

# delete word to "/" on Ctrl+w
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# enable to cd, only directory name
setopt auto_cd

# prohibit C-s, C-q
setopt no_flow_control

# case ignore in auto-completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


### Prompt Setting

# git
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

# kubernetes
function _kube-current-context () {
  KUBE_PS1_CONTEXT=$(kubectl config current-context)
}
# _kube-current-context

# precmd
precmd() {
  # _kube-current-context
  vcs_info

  # 1行あける
  print

  local top_left="[%~]"
  # local top_right="⎈  (${KUBE_PS1_CONTEXT})"
  local top_right=""
  local top_left_width=${#${(S%%)top_left}}
  local top_right_width=${#${(S%%)top_right}}
  local padwidth=$(($COLUMNS - ($top_left_width + $top_right_width) % $COLUMNS - 3))

  print -P "➦ ${fg[yellow]}$top_left${reset_color}"${(r:$padwidth:: :)}"${fg[cyan]}$top_right${reset_color}"
}

# prompt
PROMPT="➥ %{${fg[green]}%}[%n@macbook] %%%{${reset_color}%} "
RPROMPT='${vcs_info_msg_0_}'
TRAPALRM() {
  zle reset-prompt
}


## 補完方法毎にグループ化する。
### 補完方法の表示方法
###   %B...%b: 「...」を太字にする。
###   %d: 補完方法のラベル
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''

## 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。
###           ただし、補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

## 補完候補に色を付ける。
### "": 空文字列はデフォルト値を使うという意味。
zstyle ':completion:*:default' list-colors ""

## 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

## 補完方法の設定。指定した順番に実行する。
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _history: ヒストリのコマンドも補完候補とする。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
zstyle ':completion:*' completer \
    _oldlist _complete _match _history _ignored _approximate _prefix

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
## 詳細な情報を使う。
zstyle ':completion:*' verbose yes
## sudo時にはsudo用のパスも使う。
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"

## カーソル位置で補完する。
setopt complete_in_word
## globを展開しないで候補の一覧から補完する。
setopt glob_complete
## 補完時にヒストリを自動的に展開する。
setopt hist_expand
## 補完候補がないときなどにビープ音を鳴らさない。
setopt no_beep
## 辞書順ではなく数字順に並べる。
setopt numeric_glob_sort


# 展開
## --prefix=~/localというように「=」の後でも
## 「~」や「=コマンド」などのファイル名展開を行う。
setopt magic_equal_subst
## 拡張globを有効にする。
## glob中で「(#...)」という書式で指定する。
#setopt extended_glob <- git reset HEAD^が聞かないのでコメントアウト
# 参考: http://d.hatena.ne.jp/supermassiveblackhole/20100820/1282284495
## globでパスを生成したときに、パスがディレクトリだったら最後に「/」をつける。
setopt mark_dirs
# tmux solarized
set -g default-terminal "screen-256color"


alias dirs='dirs -p'
alias gvim='open /Applications/MacVim.app'

# ls
alias ls='ls --color'
alias ll='ls -altr'

# vim
alias vi='nvim'
alias vim='nvim'

# tmux
alias tmux="tmux -2"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# setting for `z`
if command -v brew >/dev/null 2>&1; then
  # Load rupa's z if installed
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

localize_file="${HOME}/.zshrc.local"
if [ -f ${localize_file} ]; then
	source ${localize_file}
fi

# for k8s
source <(kubectl completion zsh)
function gi() { curl -sL https://www.gitignore.io/api/$@ ;}

# Pyenv
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/shims:$PATH
    eval "$(pyenv init -)"
fi

# asdf
. $(brew --prefix asdf)/asdf.sh

# Powerline
export POWERLINE_HOME="$(pyenv root)/versions/$(pyenv version-name)/lib/python3.7/site-packages/powerline"
