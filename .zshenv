# PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export GOPATH=$HOME/go
# export PATH=/usr/lib/ccache/bin:$HOME/bin:/usr/local/bin:$GOPATH/bin:$PATH
path=(/usr/lib/ccache/bin(N-/) $HOME/bin(N-/) /usr/local/bin(N-/) $GOPATH/bin(N-/) $path)
path=($HOME/.cargo/bin(N-/) $path)

# EDITOR
export EDITOR=vim
# Alias作りましょうねー
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias c='clear'
alias l='ls -l'
alias tree='tree -N'
alias pbcopy='xsel --clipboard --input'
alias tokyo="curl wttr.in/Tokyo"
alias wttr='function _weather(){ curl "wttr.in/$1"; };_weather'
alias nm="echo '@dohq 頼まれてた処理が終わったかしら' | sh ~/bin/notify-me.sh"

# Gitting
alias gl='git lg'
alias gm='git commit -v'
alias ga='git add'
alias gc='git clone'
alias gp='git push'
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gnd='git config user.name "dohq" && git config user.email "dorastone@gmail.com"'

# interactive select for fzf
if [ -x "`which fzf`" ]; then
  alias ll='ls -lha | fzf'
  alias tp='top | fzf'
  alias pp='ps aux | fzf'
fi

# interactive repl for python
if [[ -x ptpython ]]; then
  alias p='ptpython'
fi

# fzf
export FZF_DEFAULT_OPTS='--height 70% --no-sort +m --reverse'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# hub alias
function git(){hub "$@"}

# linuxbre
if [[ -d ~/.linuxbrew ]]; then
  PATH="$HOME/.linuxbrew/bin:$PATH"
  export MANPATH="$(brew --prefix)/share/man:$MANPATH"
  export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"
fi

# RUST_SRC_PATH
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src
