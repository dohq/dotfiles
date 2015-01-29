# LANG Setting
export LANG=ja_JP.UTF-8
# PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH
export GOPATH=$HOME/_go
export PATH=$PATH:$GOPATH/bin
export PATH=/usr/local/bin:/opt/local:/usr/local/go/bin:$PATH

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
# Gitting
alias gl="git log --pretty='medium-reverse' --graph --name-status"
alias gm="git commit"
alias gc="git clone"
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

# hub alias
function git(){hub "$@"}

# zsh-completions
[ -d $HOME/.zsh/zsh-completions/src ] && fpath=($HOME/.zsh/zsh-completions/src $fpath)
