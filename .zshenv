# LANG Setting
export LANG=ja_JP.UTF-8
# PATH
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PATH=/usr/local/bin:$PATH
export LD_LIBRARY_PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/_go
export PATH=$PATH:$GOPATH/bin

# Alias作りましょうねー
alias vi='vim'
alias emerge='emerge --quiet-build'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

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
