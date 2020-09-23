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
# completion
autoload -Uz compinit && compinit
zinit cdreplay -q # <- execute compdefs provided by rest of plugins
zinit cdlist # look at gathered compdefs
# 短縮補完の有効化 (https://gihyo.jp/dev/serial/01/zsh-book/0005)
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
# <Tab> でパス名の補完候補を表示したあと、
zstyle ':completion:*:default' menu select=1
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

########################################
# edit-command
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

# smart insert last word
autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
bindkey '^]' insert-last-word

########################################
# 色を使用出来るようにする
autoload -Uz colors; colors
# vim 風キーバインドにする
bindkey -v
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

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
# reqire romkatv/gitstatus {{{
function gitstatus_prompt_update() {
  emulate -L zsh
  typeset -g  GITSTATUS_PROMPT=''

  # Call gitstatus_query synchronously. Note that gitstatus_query can also be called
  # asynchronously; see documentation in gitstatus.plugin.zsh.
  gitstatus_query 'MY'                  || return 1  # error
  [[ $VCS_STATUS_RESULT == 'ok-sync' ]] || return 0  # not a git repo

  local      clean='%39F'   # green foreground
  local   modified='%178F'  # yellow foreground
  local  untracked='%76F'   # blue foreground
  local conflicted='%196F'  # red foreground

  local p

  local where  # branch name, tag or commit
  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    where=$VCS_STATUS_LOCAL_BRANCH
  elif [[ -n $VCS_STATUS_TAG ]]; then
    p+='%f#'
    where=$VCS_STATUS_TAG
  else
    p+='%f@'
    where=${VCS_STATUS_COMMIT[1,8]}
  fi

  (( $#where > 32 )) && where[13,-13]="…"  # truncate long branch names and tags
  p+="${clean}${where//\%/%%}"             # escape %

  # ⇣42 if behind the remote.
  (( VCS_STATUS_COMMITS_BEHIND )) && p+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
  # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
  (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && p+=" "
  (( VCS_STATUS_COMMITS_AHEAD  )) && p+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
  # ⇠42 if behind the push remote.
  (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && p+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
  (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && p+=" "
  # ⇢42 if ahead of the push remote; no leading space if also behind: ⇠42⇢42.
  (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && p+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
  # *42 if have stashes.
  (( VCS_STATUS_STASHES        )) && p+=" ${clean}*${VCS_STATUS_STASHES}"
  # 'merge' if the repo is in an unusual state.
  [[ -n $VCS_STATUS_ACTION     ]] && p+=" ${conflicted}${VCS_STATUS_ACTION}"
  # ~42 if have merge conflicts.
  (( VCS_STATUS_NUM_CONFLICTED )) && p+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
  # +42 if have staged changes.
  (( VCS_STATUS_NUM_STAGED     )) && p+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
  # !42 if have unstaged changes.
  (( VCS_STATUS_NUM_UNSTAGED   )) && p+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
  # ?42 if have untracked files. It's really a question mark, your font isn't broken.
  (( VCS_STATUS_NUM_UNTRACKED  )) && p+=" ${untracked}?${VCS_STATUS_NUM_UNTRACKED}"

  # GITSTATUS_PROMPT="${p}%f"
  print "${p}%f"
}
# 
# Start gitstatusd instance with name "MY". The same name is passed to
# gitstatus_query in gitstatus_prompt_update. The flags with -1 as values
# enable staged, unstaged, conflicted and untracked counters.
gitstatus_stop 'MY' && gitstatus_start -s -1 -u -1 -c -1 -d -1 'MY'

# On every prompt, fetch git status and set GITSTATUS_PROMPT.
# autoload -Uz add-zsh-hook
# add-zsh-hook precmd gitstatus_prompt_update

# Enable/disable the right prompt options.
setopt no_prompt_bang prompt_percent prompt_subst
# }}}
typeset -Ag prompt_data

function prompt_k8s() {
  print '$(kube_ps1)'
}

# section for git branch
function prompt_git() {
  cd -q $1
  gitstatus_prompt_update
}

KUBE_PS1_SYMBOL_ENABLE=true
# refresh prompt with new data
prompt_refresh() {
  RPROMPT="$prompt_data[prompt_git] $prompt_data[prompt_k8s] "
  # Redraw the prompt.
  zle reset-prompt
}

prompt_callback() {
  local job=$1 output=$3
  prompt_data[$job]=$output
  prompt_refresh
}

# Start async worker
async_start_worker 'prompt' -n -u
# Register callback function for the workers completed jobs
async_register_callback 'prompt' prompt_callback

# Setup
add-zsh-hook precmd (){
  async_job 'prompt' prompt_k8s
  async_job 'prompt' prompt_git $PWD # required
}

RPROMPT=''
# }}}

########################################
# オプション
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
# ディレクトリ名だけでcdする
setopt auto_cd
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
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify
# 高機能なワイルドカード展開を使用する
setopt extended_glob
# 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs
# 補完候補一覧でファイルの種別を識別マーク表示(ls -F の記号)
setopt list_types
# --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
# カッコの対応などを自動的に補完
setopt auto_param_keys
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# スペルチェック
setopt correct
# rm *で確認を求める
setopt rm_star_wait
# 補完候補を一覧表示
setopt auto_list
# TAB で順に補完候補を切り替える
setopt auto_menu

#######################################
# Home Endキーを有効に
bindkey "^[[1~"   beginning-of-line
bindkey "^[[4~"   end-of-line
bindkey "^[[3~"   delete-char
bindkey "^[3;5~"  delete-char

########################################
# init
# hub alias
function git(){hub "$@"}
# gitignore
function gi() { curl -L -s https://www.gitignore.io/api/"$@" >> .gitignore ;}
# remove dupulicate path/PATH
typeset -U path PATH

if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
