TARGET_DIR := ~/.config/tint2

.PHONY: install
install:
	@rsync -va --delete \
	    -f '- Home.mk' \
	    ./ $(TARGET_DIR)/

$(TARGET_DIR):
	install -d $(TARGET_DIR)
