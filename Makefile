git: git/.gitconfig ~/bin
	stow -t ~ -S git
	stow -t ~/bin -S bin

~/bin:
	if grep "export PATH="\$$HOME/bin:\$$PATH"" ~/.profile; then \
		echo "PATH Already defined in .profile file";\
	else \
		echo "export PATH=\"\$$HOME/bin:\$$PATH\""¬ >> ~/.profile;\
		/bin/cat ~/.profile;\
	fi
	mkdir ~/bin
	. ~/.profile

git/.gitconfig:
	$(eval USER := $(shell bash -c 'read -p "User: " user; echo $$user'))
	$(eval MAIL := $(shell bash -c 'read -p "Email: " mail; echo $$mail'))
	cp $(CURDIR)/gitconfig.dist $@
	sed 's#USER#$(USER)#g' -i $@
	sed 's#MAIL#$(MAIL)#g' -i $@

clean:
	@echo 'Remove Git config'
	stow -t ~ -D git
	stow -t ~/bin -D bin
	rm -rf git/gitconfig

