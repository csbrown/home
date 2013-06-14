TARGET_DIR := ~/.vim

.PHONY: install
install:
	@rsync -va --delete \
	    -f '- .git' \
	    -f '- .gitignore' \
	    -f '- Home.mk' \
	    -f '- tags' \
	    ./ $(TARGET_DIR)/
	@echo "vim: Generate helptags"
	@vim -c "call pathogen#helptags()" -c quit

$(TARGET_DIR):
	install -d $(TARGET_DIR)
