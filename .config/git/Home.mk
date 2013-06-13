TARGET_DIR := ~/.config/git

.PHONY: install
install:
	rm -f ~/.gitconfig
	@rsync -va --delete \
	    -f '- Home.mk' \
	    -f '- .gitignore' \
	    -f '- local' \
	    ./ $(TARGET_DIR)/

$(TARGET_DIR):
	install -d $(TARGET_DIR)
