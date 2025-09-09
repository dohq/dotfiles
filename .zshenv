# zmodload zsh/zprof && zprof

export EDITOR=vim
# export JAVA_HOME=/usr/lib/jvm/default
# export GOPROXY=proxy.golang.org
export VAGRANT_DEFAULT_PROVIDER=libvirt
export ZSH_WAKATIME_BIN=$(which wakatime)
export DOCKER_BUILDKIT=1
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
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
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# PATH
path=(
  $HOME/bin(N-/)
  $HOME/go/bin(N-/)
  $HOME/flutter/bin(N-/)
  $HOME/.local/bin(N-/)
  $HOME/.tfenv/bin(N-/)
  $HOME/.tiup/bin(N-/)
  $HOME/.dotnet/tools/(N-/)
  $HOME/.pub-cache/bin(N-/)
  $HOME/.local/share/pnpm(N-/)
  $HOME/Android/Sdk/cmdline-tools/latest/bin/(N-/)
  $HOME/Android/Sdk/emulator/(N-/)
  /usr/local/bin(N-/)
  /usr/lib/ccache/bin(N-/)
  $path
)
# remove dupulicate path/PATH
typeset -U path cdpath fpath manpath
