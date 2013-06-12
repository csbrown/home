TARGET_DIR := ~/opt

.PHONY: install
install: $(TARGET_DIR)
	@rsync -va --delete \
	    -f '- .git' \
	    -f '- .gitignore' \
	    taro/ $(TARGET_DIR)/taro/

$(TARGET_DIR)/%: %
	install -t $(TARGET_DIR) $^
