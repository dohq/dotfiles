export EDITOR=vim
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export GOPATH=$HOME/go
export PERL5LIB=$HOME/perl5/lib/perl5
export PERL_LOCAL_LIB_ROOT=$HOME/perl5
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
export USE_CCACHE=1
if [[ -d /mnt/ssd/ccache ]]; then
  export CCACHE_DIR=/mnt/ssd/ccache
fi

# PATH
path=(/usr/lib/ccache/bin(N-/) /usr/local/bin(N-/) $path)
path=($HOME/.local/bin(N-/) $HOME/bin(N-/) $GOPATH/bin(N-/) $path)
path=($HOME/.cargo/bin(N-/) $path)
path=($HOME/.gem/ruby/2.5.0/bin(N-/) $path)
path=($HOME/.gem/ruby/2.6.0/bin(N-/) $path)
path=($HOME/perl5/bin(N-/) $path)
path=($HOME/.local/bin(N-/) $path)
path=($HOME/.tfenv/bin(N-/) $path)

# Alias作りましょうねー
alias c='clear'
alias cp='cp -i'
alias d='docker'
alias f='find . -name'
alias ls='ls --color'
alias ll='ls -la'
alias la='ls -lah'
alias mkdir='mkdir -p'
alias m='mkdir -p'
alias mv='mv -i'
alias nm="$HOME/bin/notify-me.sh"
alias nv='nvim'
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection c -o'
alias pi='ping -c 3 google.com'
alias pp='ps aux | peco'
alias rm='rm -i'
alias ssh='ssh -o ServerAliveInterval=60'
alias tokyo="curl wttr.in/Tokyo"
alias tree='tree -N'
alias u='up'
alias v='vim'
alias vi='vim'
alias wttr='function _weather(){ curl "wttr.in/$1"; };_weather'

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

# gitignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
