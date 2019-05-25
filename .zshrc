########################################
# source
# source seacret
if [[ -f ~/.token ]]; then
  source ~/.token
fi

# source zsh_local
if [[ -f ~/.zsh_local ]]; then
  source ~/.zsh_local
fi

########################################
# zplug
if [[ -f ~/.zplug/init.zsh ]]; then
  source ~/.zplug/init.zsh
  source ~/.zsh_plug
  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  # Then, source plugins and add commands to $PATH
  zplug load
fi
########################################
# 環境変数
# 補完リストその他でもASCII(7ビット)以上の文字(8ビダ(ncm2_auto_trigger)ト)文字を表示 
# (マルチバイト文字補完)
setopt PRINT_EIGHT_BIT
# 色を使用出来るようにする
# autoload -Uz colors; colors

# vim 風キーバインドにする
bindkey -v

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# プロンプト指定
PROMPT="
[%n"@"%m %T] %{${fg[yellow]}%}%(5~|%-1~/…/%3~|%4~)%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "
# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '
# もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# bash compinit
autoload -U +X bashcompinit && bashcompinit

########################################
# もしかして機能
setopt correct

# <Tab> でパス名の補完候補を表示したあと、
zstyle ':completion:*:default' menu select=1

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

########################################
# vcs_info
# vcs_info 設定{{{
RPROMPT=""
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
# 以下の3つのメッセージをエクスポートする
# $vcs_info_msg_0_ : 通常メッセージ用 (緑)
# $vcs_info_msg_1_ : 警告メッセージ用 (黄色)
# $vcs_info_msg_2_ : エラーメッセージ用 (赤)
zstyle ':vcs_info:*' max-exports 3
zstyle ':vcs_info:*' enable git svn hg bzr
# 標準のフォーマット(git 以外で使用)
# misc(%m) は通常は空文字列に置き換えられる
zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true
if is-at-least 4.3.10; then

  # git 用のフォーマット
  # git のときはステージしているかどうかを表示
  if [ -f /usr/bin/git ]; then
    zstyle ':vcs_info:git:*:-all-' command /usr/bin/git
  fi
  zstyle ':vcs_info:git:*' formats '(%s)-[%b]' '%c%u %m'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+" # %c で表示する文字列
  zstyle ':vcs_info:git:*' unstagedstr "-" # %u で表示する文字列
fi
# hooks 設定
if is-at-least 4.3.11; then
  # git のときはフック関数を設定する
  # formats '(%s)-[%b]' '%c%u %m' , actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
  # のメッセージを設定する直前のフック関数
  # 今回の設定の場合はformat の時は2つ, actionformats の時は3つメッセージがあるので
  # 各関数が最大3回呼び出される。
  zstyle ':vcs_info:git+set-message:*' hooks \
    git-hook-begin \
    git-untracked \
    git-push-status \
    git-nomerge-branch \
    git-stash-count

  # フックの最初の関数
  # git の作業コピーのあるディレクトリのみフック関数を呼び出すようにする
  # (.git ディレクトリ内にいるときは呼び出さない)
  # .git ディレクトリ内では git status --porcelain などがエラーになるため
  function +vi-git-hook-begin() {
  if [[ $(command $git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
    # 0以外を返すとそれ以降のフック関数は呼び出されない
    return 1
  fi
  return 0
}
# untracked フィアル表示
#
# untracked ファイル(バージョン管理されていないファイル)がある場合は
# unstaged (%u) に ? を表示
function +vi-git-untracked() {
# zstyle formats, actionformats の2番目のメッセージのみ対象にする
if [[ "$1" != "1" ]]; then
  return 0
fi
if command $git status --porcelain 2> /dev/null \
  | awk '{print $1}' \
  | command grep -F '??' > /dev/null 2>&1 ; then
  # unstaged (%u) に追加
    hook_com[unstaged]+='?'
fi
}
# push していないコミットの件数表示
#
# リモートリポジトリに push していないコミットの件数を
# pN という形式で misc (%m) に表示する
function +vi-git-push-status() {
# zstyle formats, actionformats の2番目のメッセージのみ対象にする
if [[ "$1" != "1" ]]; then
  return 0
fi
if [[ "${hook_com[branch]}" != "master" ]]; then
  # master ブランチでない場合は何もしない
  return 0
fi
# push していないコミット数を取得する
local ahead
ahead=$(command $git rev-list origin/master..master 2>/dev/null \
  | wc -l \
  | tr -d ' ')
if [[ "$ahead" -gt 0 ]]; then
  # misc (%m) に追加
  hook_com[misc]+="(p${ahead})"
fi
}
# マージしていない件数表示
#
# master 以外のブランチにいる場合に、
# 現在のブランチ上でまだ master にマージしていないコミットの件数を
# (mN) という形式で misc (%m) に表示
function +vi-git-nomerge-branch() {
# zstyle formats, actionformats の2番目のメッセージのみ対象にする
if [[ "$1" != "1" ]]; then
  return 0
fi
if [[ "${hook_com[branch]}" == "master" ]]; then
  # master ブランチの場合は何もしない
  return 0
fi
local nomerged
nomerged=$(command $git rev-list master..${hook_com[branch]} 2>/dev/null | wc -l | tr -d ' ')
if [[ "$nomerged" -gt 0 ]] ; then
  # misc (%m) に追加
  hook_com[misc]+="(m${nomerged})"
fi
}
# stash 件数表示
#
# stash している場合は :SN という形式で misc (%m) に表示
function +vi-git-stash-count() {
# zstyle formats, actionformats の2番目のメッセージのみ対象にする
if [[ "$1" != "1" ]]; then
  return 0
fi
local stash
stash=$(command $git stash list 2>/dev/null | wc -l | tr -d ' ')
if [[ "${stash}" -gt 0 ]]; then
  # misc (%m) に追加
  hook_com[misc]+=":S${stash}"
fi
}
fi
function _update_vcs_info_msg() {
  local -a messages
  local prompt
  LANG=en_US.UTF-8 vcs_info
  if [[ -z ${vcs_info_msg_0_} ]]; then
    # vcs_info で何も取得していない場合はプロンプトを表示しない
    prompt=""
  else
    # vcs_info で情報を取得した場合
    # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
    # それぞれ緑、黄色、赤で表示する
    [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
    [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
    [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )
    # 間にスペースを入れて連結する
    prompt="${(j: :)messages}"
  fi
  RPROMPT="$prompt"
}
add-zsh-hook precmd _update_vcs_info_msg
#}}}
########################################
# オプション
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

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

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

# direnv
if [[ -x "`which direnv`" ]]; then
  if type "zsh" > /dev/null 2>&1; then
    eval "$(direnv hook zsh)"
  fi
fi

# pyenv
if [[ -x "`which pyenv`" ]]; then
  eval "$(pyenv init -)"
fi

# Hashi
if [[ -x "`which nomad`" ]]; then
  complete -o nospace -C nomad nomad
fi
if [[ -x "`which consul`" ]]; then
  complete -o nospace -C consul consul
fi
if [[ -x "`which vault`" ]]; then
  complete -o nospace -C vault vault
fi
