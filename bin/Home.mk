TARGET_DIR := ~/bin

.PHONY: install
install:
	@rsync -va --delete \
	    -f '- Home.mk' \
	    ./ $(TARGET_DIR)/

$(TARGET_DIR):
	install -d $(TARGET_DIR)
