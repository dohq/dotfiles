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

# docker
alias dip='docker ps -q | xargs docker inspect --format='{{.NetworkSettings.IPAddress}} -- {{.Name}}''
alias dl='docker ps -l -q'

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

# anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

# gitignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# hub alias
function git(){hub "$@"}

# export brew github api token
if [ -f ~/.brew_api_token ];then
  source ~/.brew_api_token
fi

# check if `docker-machine` command exists
if command -v docker-machine > /dev/null; then
  # fetch the first running machine name
  local machine=$(docker-machine ls | grep Running | head -n 1 | awk '{ print $1 }')
  if [ "$machine" != "" ]; then
    eval "$(docker-machine env $machine)"
    export DOCKER_IP=$(docker-machine ip $machine)
  fi
fi
