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
alias gm="git commit -v"
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

# anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

# gobrew
if [ -d $HOME/.gobrew ] ; then
    export PATH="$HOME/.gobrew/bin:$PATH"
    eval "$(gobrew init -)"
fi

# peco git add
function peco-select-gitadd() {
    local SELECTED_FILE_TO_ADD="$(git status --porcelain | \
                                  peco --query "$LBUFFER" | \
                                  awk -F ' ' '{print $NF}')"
    if [ -n "$SELECTED_FILE_TO_ADD" ]; then
      BUFFER="git add $(echo "$SELECTED_FILE_TO_ADD" | tr '\n' ' ')"
      CURSOR=$#BUFFER
    fi
    zle accept-line
    # zle clear-screen
}
zle -N peco-select-gitadd
bindkey "^g^a" peco-select-gitadd

# gitignore
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# android-ndk
export NDK_HOME=$HOME/dev/ndk
export NDK_PREFIX=$HOME/android/libs
export NDK_HOST_ARM=arm-linux-androideabi
export NDK_TOOLCHAIN_ARM=$HOME/dev/arm-android-8/toolchain
export NDK_HOST_X86=i686-linux-android
export NDK_TOOLCHAIN_X86=$HOME/dev/x86-android-9/toolchain
export NDK_HOST_MIPS=mipsel-linux-android
export NDK_TOOLCHAIN_MIPS=$HOME/dev/mips-android-9/toolchain
export PATH=$PATH:$NDK_HOME:$NDK_TOOLCHAIN_ARM/bin:$NDK_TOOLCHAIN_X86/bin:$NDK_TOOLCHAIN_MIPS/bin

# enhanced
if [ -f ~/enhancd/enhancd.sh  ]; then
  source ~/enhancd/enhancd.sh
fi
