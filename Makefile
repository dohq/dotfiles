.PHONY: init

init: ## init dotfiles
	test -L ${HOME}/.tmux || rm -rf ${HOME}/.tmux
	ln -vsn ${PWD}/.tmux ${HOME}/.tmux
	ln -vs ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	ln -vs ${PWD}/.gitconfig ${HOME}/.gitconfig
	ln -vs ${PWD}/.gvimrc ${HOME}/.gvimrc
	ln -vs ${PWD}/.vimrc ${HOME}/.vimrc
	ln -vs ${PWD}/.xinitrc ${HOME}/.xinitrc
	ln -vs ${PWD}/.Xresources ${HOME}/.Xresources
	ln -vs ${PWD}/.zshenv ${HOME}/.zshenv
	ln -vs ${PWD}/.zsh_plug ${HOME}/.zsh_plug
	ln -vs ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vs ${PWD}/config/rofi/config ${HOME}/.config/rofi/config
	ln -vs ${PWD}/config/dunst/dunstrc ${HOME}/.config/dunst/dunstrc
	ln -vs ${PWD}/config/pulseaudio/default.pa ${HOME}/.config/pulseaudio/default.pa

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
