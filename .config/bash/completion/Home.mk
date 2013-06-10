TARGETS := \
    40-git.bash \
    40-repo.bash \
    40-todo.bash \
    50-todo-intel.bash \
    50-todo-kiwi.bash \
    $(NULL)

TARGET_DIR := ~/.config/bash/completion

.PHONY: install
install: $(addprefix $(TARGET_DIR)/,$(TARGETS))

$(TARGET_DIR):
	install -d $(TARGET_DIR)

$(TARGET_DIR)/%: %
	install -t $(TARGET_DIR) $^
