GIT_SIGNING_KEY=$(shell gpg --list-keys $(GIT_AUTHOR_EMAIL) | grep -v "^pub\\|^uid" | grep -o '.\{8\}$$')

EXECUTABLES = stow gpg git
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

include .env

git: git/.gitconfig
	stow -t ~ -S git

clean:
	@echo 'Remove Git config'
	stow -t ~ -D git
	rm -rf git/.gitconfig

git/.gitconfig:
	cp gitconfig.dist $@
	git config --global user.name "$(GIT_AUTHOR_NAME)"
	git config --global user.email "$(GIT_AUTHOR_EMAIL)"
	git config --global github.user "$(GITHUB_USER)"
	git config --global user.signingkey "$(GIT_SIGNING_KEY)"
