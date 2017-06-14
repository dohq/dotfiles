# LANG Setting
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export GOPATH=$HOME/go
export PATH=/usr/local/bin:$HOME/.cabal/bin:/sbin:$GOPATH/bin:$PATH
if [ -d /usr/local/go ]; then
  export PATH=/usr/local/go/bin:$PATH
fi

if [ -d /usr/lib/jvm/java-8-openjdk ]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
fi

# build AOSP OPT
export USE_CCACHE=1
export MAVEN_OPTS="-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true"

# Alias作りましょうねー
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias cls='clear'
alias tree='tree -N'
alias nm="echo '@dohq 頼まれてた処理が終わったかしら' | sh ~/bin/notify-me.sh"
if [ -x "`which peco`" ]; then
  alias ll='ls -lha | peco'
  alias tp='top | peco'
  alias pp='ps aux | peco'
fi

# terminal color
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_ashes

# Gitting
alias gl="git lg"
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

# export heroku
if [ -d /usr/local/heroku/bin ];then
  PATH=/usr/local/heroku/bin:$PATH
fi

# anaconda
if [ -d /opt/anaconda/ ];then
  #qtconsole Option
  export FONT_CMD='--ConsoleWidget.font_family=\"RictyDiminished\"'
  export FONT_SIZE_CMD='--ConsoleWidget.font_size=11'
  # Anaconda3
  export anaconda_DIR='/opt/anaconda/bin'
  alias conda3='$anaconda_DIR/conda'
  alias pip3='$anaconda_DIR/pip'
  alias py3='$anaconda_DIR/python'
  alias ipy3='$anaconda_DIR/ipython'
  alias jupy3n='$anaconda_DIR/jupyter-notebook'
  alias jupy3c='$anaconda_DIR/jupyter-qtconsole $FONT_CMD $FONT_SIZE_CMD'
fi
