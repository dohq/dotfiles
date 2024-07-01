########################################
# Plugin Manager
source "$HOME/dotfiles/.zinitrc"

########################################
# Basic
# autoload {{{
# color
autoload -Uz colors; colors
# completion
autoload -Uz compinit
if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
# }}}
# Options {{{
setopt correct
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
setopt interactive_comments
setopt auto_pushd
setopt pushd_ignore_dups
setopt long_list_jobs
setopt list_types
setopt magic_equal_subst
setopt auto_param_slash
setopt rm_star_wait
setopt auto_list
setopt auto_menu
# }}}

########################################
# Prompt
# PROMPT {{{
PROMPT="
[%n"@"%m %T] %{${fg[yellow]}%}%(5~|%-1~/…/%3~|%4~)%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "
PROMPT2='[%n]> '
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "
# }}}
# RPROMPT {{{
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[white]%} "
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[magenta]%}->%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_bold[cyan]%}↓ "
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[cyan]%}↑ "
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$fg[red]%}X:"
ZSH_THEME_GIT_PROMPT_STAGED=" %{$fg[green]%}M:"
ZSH_THEME_GIT_PROMPT_UNSTAGED=" %{$fg[red]%}M:"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[red]%}?:"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔ "
ZSH_THEME_GIT_PROMPT_STASHED=" %{$fg[blue]%}Stash:"
ZSH_GIT_PROMPT_SHOW_UPSTREAM=full
ZSH_GIT_PROMPT_SHOW_STASH=1
ZSH_GIT_PROMPT_FORCE_BLANK=1
RPROMPT='$(gitprompt)'
# }}}

########################################
# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt append_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt share_history

########################################
# source zsh_local
if [[ -f ~/.zsh_local ]]; then
  source ~/.zsh_local
fi

########################################
# func
# gitignore
function gi() { curl -L -s https://www.gitignore.io/api/"$@";}

########################################
# edit-command
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

#######################################
# Home Endキーを有効に
bindkey "^[[1~"   beginning-of-line
bindkey "^[[4~"   end-of-line
bindkey "^[[3~"   delete-char
bindkey "^[3;5~"  delete-char

########################################
# Alias作りましょうねー
alias c='clear'
alias cp='cp -i --reflink=auto'
alias mv='mv -i'
alias rm='rm -i'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias ls='ls --color'
alias ll='ls -lah'
alias ltr='ls -lhtr'
alias mkdir='mkdir -p'
alias m='mkdir -p'
alias nm="$HOME/bin/notify-me.sh"
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection c -o'
alias pi='ping -c 3 google.com'
alias pp='ps aux | fzf'
alias tb='nc termbin.com 9999'
alias tky='curl wttr.in/Tokyo'
alias tree='tree -N'
alias u='up'
alias s='sudo'
alias wttr='function _weather(){ curl "wttr.in/$1"; };_weather'
if type vim > /dev/null; then
  alias vi='vim'
  alias v='vim'
  alias vd='vimdiff'
fi
# openstack
alias op='openstack'
# nomad
alias n='nomad'
alias nf='nomad fmt -write=true -recursive'
alias njp='nomad job plan'
alias njr='nomad job run'
alias njs='nomad job stop -purge'
alias njv='nomad job validate'
# Ansible
alias a='ansible'
alias ap='ansible-playbook'
alias av='ansible-vault'
alias ag='ansible-galaxy'
# docker
alias d='docker'
alias di='docker images'
alias dr='docker run --rm'
alias dp='docker ps'
alias dpa='docker ps -a'
alias dl='docker logs -f'
alias dc='docker compose'
alias dcu='docker compose up'
alias dcud='docker compose up -d'
# kubernetes
alias kns='kubens'
alias kcx='kubectx'
alias k='kubectl'
# terraform
alias tf='terraform'
alias tfpp='terraform plan -out plan --parallelism=30'
alias tfap='terraform apply plan'
alias tfop='terraform output'
alias tfv='terraform validate'
alias tff='terraform fmt'
# Gitting
if type hub > /dev/null; then
  alias git='hub'
fi
alias g='git'
alias ga='git add'
alias gc='git clone'
alias gb='git branch'
alias gco='git checkout'
alias gsw='git switch'
alias gd='git diff'
alias gf='git fetch --all'
alias gl='git log --oneline --pretty=format:"%h [%cd] %d %s <%an>" --date=format:"%Y/%m/%d %H:%M:%S" --graph'
alias gm='git commit -v'
alias gnd='git init && git config user.name "dohq" && git config user.email "dorastone@gmail.com"'
alias gp='git push'
alias gs='git status'
alias gg='ghq get -p'
# goto Dev dir
alias dohq='cd $HOME/go/src/github.com/dohq'

# Eval
if command -v mise > /dev/null; then
  eval "$(mise activate zsh)"
fi

########################################
# zprof
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi