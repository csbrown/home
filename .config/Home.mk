SUBDIRS := \
    awesome \
    bash \
    git \
    gnome-session/sessions \
    kiwi-dmenu \
    openbox \
    profile \
    tint2 \
    $(NULL)

.PHONY: install
install:
	@for i in $(SUBDIRS); do \
	    make -C $i -f Home.mk install;
	done
