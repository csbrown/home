TARGET_DIR := ~

TARGETS := \
    .bash_profile \
    .bashrc

.PHONY: install
install: $(TARGET_DIR) $(addprefix $(TARGET_DIR)/,$(TARGETS))
	@make -C .config -f Home.mk install

$(TARGET_DIR)/%: %
	install -t $(TARGET_DIR) $^
