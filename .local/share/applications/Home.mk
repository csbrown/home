TARGETS := \
    gtk-redshift.desktop \
    $(NULL)

TARGET_DIR := ~/.local/share/applications

.PHONY: install
install: $(TARGET_DIR) $(addprefix $(TARGET_DIR)/,$(TARGETS))

$(TARGET_DIR):
	install -d $(TARGET_DIR)

$(TARGET_DIR)/%: %
	install -t $(TARGET_DIR) $^
