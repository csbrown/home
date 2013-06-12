TARGET_DIR := ~/opt

SYNC_SUBDIRS := \
    git-repo \
    taro

.PHONY: install
install: $(TARGET_DIR)
	@for i in $(SYNC_SUBDIRS); do \
	    rsync -va --delete \
		-f '- .git' \
		-f '- .gitignore' \
		$$i/ $(TARGET_DIR)/$$i/; \
	done

$(TARGET_DIR)/%: %
	install -t $(TARGET_DIR) $^
