# LANG Setting
export LANG=ja_JP.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export GOPATH=$HOME/go
#export GOROOT=/usr/local/go
#export PATH=$PATH:$GOROOT/bin
export PATH=/usr/local/bin:$HOME/.cabal/bin:/sbin:$GOPATH/bin:$PATH

# Alias作りましょうねー
alias vi='nvim'
alias nvi='nvim'
alias emerge='emerge --quiet-build'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias cls='clear'
alias tree='tree -N'
if [ -x "`which peco`" ]; then
  alias ll='ls -lha | peco'
  alias tp='top | peco'
  alias pp='ps aux | peco'
fi

# pandocでPDF
alias ppdf='pandoc -V documentclass=ltjarticle -V monofont=Consolas --latex-engine=lualatex -N --toc'

# Macでlsusb
case ${OSTYPE} in
  darwin*)
    alias lsusb='system_profiler SPUSBDataType'
    alias updatedb='sudo /usr/libexec/locate.updatedb'
    ;;
esac

# Gitting
alias gl="git log --pretty='medium-reverse' --graph --name-status"
alias gm="git commit -v"
alias ga="git add"
alias gc="git clone"
alias gp="git push"
alias g="git"
alias gs="git status"
alias gd="git diff"

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# cabal
if [ -d $HOME/.cabal ] ; then
    export PATH="$HOME/.cabal//bin:$PATH"
fi

# anyenv
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# hub alias
function git(){hub "$@"}

# export brew github api token
if [ -f ~/.brew_api_token ];then
  source ~/.brew_api_token
fi

# export heroku
if [ -d /usr/local/heroku/bin ];then
  PATH=/usr/local/heroku/bin:$PATH
fi
