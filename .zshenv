# zmodload zsh/zprof && zprof

export EDITOR=vim
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export PERL5LIB=$HOME/perl5/lib/perl5
export PERL_LOCAL_LIB_ROOT=$HOME/perl5
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
export USE_CCACHE=1
export GOPATH=$HOME/go
export JAVA_HOME=/usr/lib/jvm/default
export GOPROXY=proxy.golang.org
export SSH_ASKPASS=ssh-askpass
export VAGRANT_DEFAULT_PROVIDER=libvirt
if [[ -e $XDG_RUNTIME_DIR/docker.sock ]]; then
  export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
fi

# If command execution time above min. time, plugins will not output time.
export ZSH_COMMAND_TIME_MIN_SECONDS=5

if command -v sccache >/dev/null; then
  export RUSTC_WRAPPER=$(which sccache)
  export SCCACHE_DIR=$HOME/.cache/sccache
fi
if command -v ccache >/dev/null; then
  export CCACHE_DIR=$HOME/.cache/ccache
fi

# PATH
path=(
  /usr/lib/ccache/bin(N-/)
  $HOME/.ghg/bin(N-/)
  $HOME/bin(N-/)
  $GOPATH/bin(N-/)
  $HOME/.local/bin(N-/)
  $HOME/.cargo/bin(N-/)
  $HOME/.gem/ruby/2.5.0/bin(N-/)
  $HOME/.gem/ruby/2.6.0/bin(N-/)
  $HOME/.gem/ruby/2.7.0/bin(N-/)
  $HOME/perl5/bin(N-/)
  $HOME/.tfenv/bin(N-/)
  /usr/local/bin(N-/)
  $path
)

# Alias作りましょうねー
alias c='clear'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias f='find . -name'
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
alias tokyo='curl wttr.in/Tokyo'
alias tree='tree -N'
alias u='up'
alias v='vim'
alias vd='vimdiff'
alias wttr='function _weather(){ curl "wttr.in/$1"; };_weather'
alias ssh='TERM=xterm ssh'

# openstack
alias op='openstack'
# docker
alias d='docker'
alias dim='docker image'
alias dp='docker ps'
alias dpa='docker ps -a'
# kubernetes
alias kns='kubens'
alias kcx='kubectx'
# terraform
alias tf='terraform'
alias tfpp='terraform plan -out plan --parallelism=30'
alias tfap='terraform apply plan'
alias tfop='terraform output'
alias tfvt='terraform validate'
# Gitting
alias g='git'
alias ga='git add'
alias gc='git clone'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch --all'
alias gl='git log --oneline --pretty=format:"%h [%cd] %d %s <%an>" --date=format:"%Y/%m/%d %H:%M:%S" --graph'
alias gm='git commit -v'
alias gnd='git init && git config user.name "dohq" && git config user.email "dorastone@gmail.com"'
alias gp='git push'
alias gs='git status'

# fzf
export FZF_DEFAULT_OPTS='--height 70% --no-sort +m --reverse'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# pipenv
export PIPENV_VENV_IN_PROJECT=true
