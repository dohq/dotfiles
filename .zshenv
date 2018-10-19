# PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export GOPATH=$HOME/go
path=(/usr/lib/ccache/bin(N-/) /usr/local/bin(N-/) $path)
path=($HOME/.local/bin(N-/) $HOME/bin(N-/) $GOPATH/bin(N-/) $path)
path=($HOME/.cargo/bin(N-/) $path)
path=($HOME/.gem/ruby/2.5.0/bin(N-/) $path)

# EDITOR
export EDITOR=vim
# Alias作りましょうねー
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias c='clear'
alias ls='ls --color'
alias l='ls -l'
alias tree='tree -N'
alias pbcopy='xsel --clipboard --input'
alias tokyo="curl wttr.in/Tokyo"
alias wttr='function _weather(){ curl "wttr.in/$1"; };_weather'
alias nm="$HOME/bin/notify-me.sh"
alias vi='vim'
alias v='vim'
alias d='docker'

# Gitting
alias g='git'
alias gl='git lg'
alias gm='git commit -v'
alias ga='git add'
alias gc='git clone'
alias gg='ghq gwt'
alias gp='git push'
alias gs='git status'
alias gd='git diff'
alias gnd='git config user.name "dohq" && git config user.email "dorastone@gmail.com"'

# fzf
export FZF_DEFAULT_OPTS='--height 70% --no-sort +m --reverse'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# gitignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
