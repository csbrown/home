TARGET_DIR := ~

TARGETS := \
    .bash_profile \
    .bashrc \
    .ctags \
    .gvimrc \
    .hgrc \
    .hgignore \
    .inputrc \
    .vimrc \
    $(NULL)

SUBDIRS := \
    .config \
    .vim \
    bin \
    $(NULL)

.PHONY: install
install: $(TARGET_DIR) $(addprefix $(TARGET_DIR)/,$(TARGETS))
	@for i in $(SUBDIRS); do
	    make -C $i -f Home.mk install; \
	done
	@for i in opt/*; do \
	    if [ -r $i/Home.mk ]; then \
		make -C $i -f Home.mk install; \
	    fi; \
	done

$(TARGET_DIR)/%: %
	install -t $(TARGET_DIR) $^
