TARGET_DIR := ~/bin

.PHONY: install
install: $(TARGET_DIR)
	@rsync -va --delete \
	    -f '- Home.mk' \
	    ./ $(TARGET_DIR)/

$(TARGET_DIR):
	install -d $(TARGET_DIR)
