TARGET_DIR := ~/.config/profile

.PHONY: install
install: $(TARGET_DIR)
	rsync -va --delete ./ $(TARGET_DIR)/

$(TARGET_DIR):
	install -d $(TARGET_DIR)
