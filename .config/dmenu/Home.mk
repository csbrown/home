TARGETS := \
    environment.bash \
    list \
    $(NULL)

TARGET_DIR := ~/.config/dmenu

.PHONY: install
install: $(TARGET_DIR) $(addprefix $(TARGET_DIR)/,$(TARGETS))

$(TARGET_DIR):
	install -d $(TARGET_DIR)

$(TARGET_DIR)/%: %
	install -t $(TARGET_DIR) $^
