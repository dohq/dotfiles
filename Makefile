init: ## init dotfiles
	test -L ${HOME}/.tmux || rm -rf ${HOME}/.tmux
	ln -vsfn ${PWD}/.tmux ${HOME}/.tmux
	ln -vsf ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	ln -vsf ${PWD}/.gitconfig ${HOME}/.gitconfig
	ln -vsf ${PWD}/.gvimrc ${HOME}/.gvimrc
	ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
	ln -vsf ${PWD}/.xinitrc ${HOME}/.xinitrc
	ln -vsf ${PWD}/.Xresources ${HOME}/.Xresources
	ln -vsf ${PWD}/.zshenv ${HOME}/.zshenv
	ln -vsf ${PWD}/.zsh_plug ${HOME}/.zsh_plug
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/config/rofi/config ${HOME}/.config/rofi/config

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
