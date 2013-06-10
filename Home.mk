TARGET_DIR := ~

TARGETS := \
    .bash_profile \
    .bashrc

.PHONY: install
install: $(TARGET_DIR) $(addprefix $(TARGET_DIR)/,$(TARGETS))
	@make -C .config -f Home.mk install
	@for i in opt/*; do \
	    if [ -r $i/Home.mk ]; then \
		make -C $i -f Home.mk install; \
	    fi; \
	done

$(TARGET_DIR)/%: %
	install -t $(TARGET_DIR) $^
