# zmodload zsh/zprof && zprof

export EDITOR=vim
export JAVA_HOME=/usr/lib/jvm/default
export GOPROXY=proxy.golang.org
export VAGRANT_DEFAULT_PROVIDER=libvirt
export ZSH_WAKATIME_BIN=$(which wakatime)
export DOCKER_BUILDKIT=1
if [[ -e $XDG_RUNTIME_DIR/docker.sock ]]; then
  export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
fi
if command -v sccache >/dev/null; then
  export RUSTC_WRAPPER=$(which sccache)
  export SCCACHE_DIR=$HOME/.cache/sccache
fi
if command -v ccache >/dev/null; then
  export USE_CCACHE=1
  export CCACHE_DIR=$HOME/.cache/ccache
fi
export PICO_SDK_PATH=/usr/share/pico-sdk

# fzf
export FZF_DEFAULT_OPTS='--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
--color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
--height 60% --no-sort +m --reverse --info=inline --border --margin=1 --padding=1'

# pipenv
export PIPENV_VENV_IN_PROJECT=true

# If command execution time above min. time, plugins will not output time.
export ZSH_COMMAND_TIME_MIN_SECONDS=5

# PATH
path=(
  /usr/lib/ccache/bin(N-/)
  $HOME/bin(N-/)
  $HOME/go/bin(N-/)
  $HOME/.local/bin(N-/)
  $HOME/.cargo/bin(N-/)
  $HOME/.tfenv/bin(N-/)
  $HOME/.tiup/bin(N-/)
  $HOME/.vector/bin(N-/)
  /usr/local/bin(N-/)
  /home/dohq/.gem/ruby/3.0.0/bin(N-/)
  $path
)
# remove dupulicate path/PATH
typeset -U path cdpath fpath manpath
