TARGET_DIR := ~

TARGETS := \
    .bash_profile \
    .bashrc

$(TARGET_DIR)/%: %
	install -t $(TARGET_DIR) $^

.PHONY: install
install: $(addprefix $(TARGET_DIR)/,$(TARGETS))
	make -C .config -f Home.mk install
