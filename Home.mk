.PHONY: install
install:
	install -t ~ .bash_profile
	install -t ~ .bashrc
	@
	make -C .config -f Home.mk install
