git: ~/.gitconfig ~/.gitalias

gitconfig:
	$(eval USER := $(shell bash -c 'read -p "User: " user; echo $$user'))
	$(eval MAIL := $(shell bash -c 'read -p "Email: " mail; echo $$mail'))
	cp $(CURDIR)/gitconfig.dist gitconfig
	sed 's#USER#$(USER)#g' -i gitconfig
	sed 's#MAIL#$(MAIL)#g' -i gitconfig

~/.gitconfig: gitconfig
	ln -s $(CURDIR)/gitconfig $@

~/.gitalias:
	ln -s $(CURDIR)/gitalias $@

clean:
	@echo 'Remove Git config'
	rm -rf ~/.gitconfig ~/.gitalias gitconfig

