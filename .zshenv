# LANG Setting
export LANG=ja_JP.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PATH=/usr/local/bin:/opt/local:~/android-sdk-macosx/platform-tools:~/android-sdk-macosx/tools:$PATH

# Alias作りましょうねー
alias vi='vim'
alias emerge='emerge --quiet-build'
alias la='ls -la'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias pp='ps ax | peco'
case ${OSTYPE} in
  darwin*)
    alias lsusb='system_profiler SPUSBDataType'
    alias updatedb='sudo /usr/libexec/locate.updatedb'
    ;;
esac
# Gitting
alias gl="git log --pretty='medium-reverse' --graph --name-status"
alias gm="git commit"
alias ga="git add"
alias gc="git clone"
alias gp="git push"
alias g="git"
alias gs="git status"
alias gd="git diff"
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

# gobrew
if [ -d $HOME/.gobrew ] ; then
    export PATH="$HOME/.gobrew/bin:$PATH"
    eval "$(gobrew init -)"
fi

# enhanced
if [ -f ~/enhancd/enhancd.sh  ]; then
  source ~/enhancd/enhancd.sh
fi

# gitignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# hub alias
function git(){hub "$@"}

# Visual Stdio Code
code () {
  if [[ $# = 0 ]]
  then
    open -a "Visual Studio Code"
  else
    [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
    open -a "Visual Studio Code" --args "$F"
  fi
}

# ghs and ghq and peco = cool!
function gpi () {
  [ "$#" -eq 0 ] && echo "Usage : gpi QUERY" && return 1
  ghs "$@" | peco | awk '{print $1}' | ghq import
}
