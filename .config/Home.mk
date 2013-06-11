SUBDIRS := \
    awesome \
    bash \
    kiwi-dmenu \
    profile \
    $(NULL)

.PHONY: install
install:
	@for i in $(SUBDIRS); do \
	    make -C $i -f Home.mk install;
	done
