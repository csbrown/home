.PHONY: install
install:
	@make -C bash -f Home.mk install
	@make -C profile -f Home.mk install
