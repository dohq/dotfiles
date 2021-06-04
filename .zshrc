########################################
# zinit (zsh plugin manager) {{{
ZINIT_HOME="${ZINIT_HOME:-${ZPLG_HOME:-${ZDOTDIR:-$HOME}/.zinit}}"
ZINIT_BIN_DIR_NAME="${${ZINIT_BIN_DIR_NAME:-$ZPLG_BIN_DIR_NAME}:-bin}"
### Added by Zinit's installer
if [[ ! -f $ZINIT_HOME/$ZINIT_BIN_DIR_NAME/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
  command sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
    print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$ZINIT_HOME/$ZINIT_BIN_DIR_NAME/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# }}}
source "$HOME/.zsh_plug"

########################################
# source zsh_local
if [[ -f ~/.zsh_local ]]; then
  source ~/.zsh_local
fi

########################################
# autoload {{{
# color
autoload -Uz colors; colors
# completion
# autoload -Uz compinit && compinit
skip_global_compinit=1
autoload -Uz compinit
if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=1
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
# }}}

########################################
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000

########################################
# edit-command
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

########################################
# プロンプト指定
# PROMPT {{{
PROMPT="
[%n"@"%m %T] %{${fg[yellow]}%}%(5~|%-1~/…/%3~|%4~)%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "
# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '
# もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "
# }}}
# RPROMPT {{{
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[white]%} "
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[magenta]%}->%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[cyan]%}↓ "
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[cyan]%}↑ "
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[red]%}X:"
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[green]%}M:"
ZSH_THEME_GIT_PROMPT_UNSTAGED=" %{$fg[red]%}M:"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[red]%}?:"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔ "
ZSH_THEME_GIT_PROMPT_STASHED=" %{$fg[blue]%}Stash:"
ZSH_GIT_PROMPT_SHOW_UPSTREAM=full
ZSH_GIT_PROMPT_SHOW_STASH=1
ZSH_GIT_PROMPT_FORCE_BLANK=1
RPROMPT='$(gitprompt)'
# }}}

########################################
# Options {{{
# もしかして機能
setopt correct
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# beep を無効にする
setopt no_beep
# フローコントロールを無効にする
setopt no_flow_control
# '#' 以降をコメントとして扱う
setopt interactive_comments
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# 同時に起動したzshの間でヒストリを上書きではなく追記する
setopt append_history
# 履歴がいっぱいの時は最も古いものを先ず削除
setopt hist_expire_dups_first
# history コマンドをヒストリに入れない
setopt hist_no_store
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# 履歴検索中、(連続してなくとも)重複を飛ばす
setopt hist_find_no_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify
# 高機能なワイルドカード展開を使用する
# setopt extended_glob
# 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs
# 補完候補一覧でファイルの種別を識別マーク表示(ls -F の記号)
setopt list_types
# --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# rm *で確認を求める
setopt rm_star_wait
# 補完候補を一覧表示
setopt auto_list
# TAB で順に補完候補を切り替える
setopt auto_menu
# }}}

#######################################
# Home Endキーを有効に
bindkey "^[[1~"   beginning-of-line
bindkey "^[[4~"   end-of-line
bindkey "^[[3~"   delete-char
bindkey "^[3;5~"  delete-char

########################################
# Alias作りましょうねー
alias c='clear'
alias cp='cp -i --reflink=auto'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls --color'
alias ll='ls -lah'
alias ltr='ls -lhtr'
alias mkdir='mkdir -p'
alias m='mkdir -p'
alias nm="$HOME/bin/notify-me.sh"
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection c -o'
alias pi='ping -c 3 google.com'
alias pp='ps aux | fzf'
alias tb='nc termbin.com 9999'
alias tky='curl wttr.in/Tokyo'
alias tree='tree -N'
alias u='up'
alias wttr='function _weather(){ curl "wttr.in/$1"; };_weather'
alias ssh='TERM=xterm ssh'
alias sudo='sudo '
if type vim > /dev/null; then
  alias vi='vim'
  alias v='vim'
  alias vd='vimdiff'
fi
alias dohq='cd $HOME/go/src/github.com/dohq'

# openstack
alias op='openstack'
# Ansible
alias a='ansible'
alias ap='ansible-playbook'
alias av='ansible-vault'
alias ag='ansible-galaxy'
# docker
alias d='docker'
alias di='docker images'
alias dr='docker run --rm'
alias dp='docker ps'
alias dpa='docker ps -a'
alias dl='docker logs -f'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
# kubernetes
alias kns='kubens'
alias kcx='kubectx'
# terraform
alias tf='terraform'
alias tfpp='terraform plan -out plan --parallelism=30'
alias tfap='terraform apply plan'
alias tfop='terraform output'
alias tfv='terraform validate'
alias tff='terraform fmt'
# Gitting
if type hub > /dev/null; then
  alias git='hub'
fi
alias g='git'
alias ga='git add'
alias gc='git clone'
alias gb='git branch'
alias gco='git checkout'
alias gsw='git switch'
alias gd='git diff'
alias gf='git fetch --all'
alias gl='git log --oneline --pretty=format:"%h [%cd] %d %s <%an>" --date=format:"%Y/%m/%d %H:%M:%S" --graph'
alias gm='git commit -v'
alias gnd='git init && git config user.name "dohq" && git config user.email "dorastone@gmail.com"'
alias gp='git push'
alias gs='git status'
alias gg='ghq get'

########################################
# func
# gitignore
function gi() { curl -L -s https://www.gitignore.io/api/"$@";}

########################################
# zprof
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
