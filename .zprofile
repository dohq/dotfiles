# PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export GOPATH=$HOME/go
export PATH=/usr/lib/ccache/bin:$HOME/bin:/usr/local/bin:/sbin:$GOPATH/bin:$PATH

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
if [ -x "`which peco`" ]; then
  alias ll='ls -lha | peco'
  alias tp='top | peco'
  alias pp='ps aux | peco'
fi

# terminal color
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# fzf
export FZF_DEFAULT_OPTS='--height 70% --no-sort +m --reverse'
# export FZF_DEFAULT_OPTS='--no-sort +m --reverse'

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

# hub alias
function git(){hub "$@"}

# anyenv
if [[ -d ~/.anyenv ]]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# direnv
if [[ -x direnv ]]; then
  if type "zsh" > /dev/null 2>&1; then
    eval "$(direnv hook zsh)"
  fi
fi

# linuxbrew
if [[ -d /home/linuxbrew ]]; then
  export PATH
  export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
  export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"
  export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"
fi
