# PATH
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH
export GOROOT=/usr/local/go
export GOPATH=$HOME/_go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
PATH=$PATH:$HOME/bin
export PATH

# Alias作りましょうねー
alias vi='vim'
alias emerge='emerge --quiet-build'
alias sudo='sudo '
