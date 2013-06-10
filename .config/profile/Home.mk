TARGETS := \
    10-colors.sh \
    10-profile-functions.sh \
    40-android-sdk.sh \
    40-ccache.sh \
    40-cdargs.sh \
    40-depot_tools.sh \
    40-eclipse.sh \
    40-editor.sh \
    40-git-prompt.sh \
    40-intellij.sh \
    40-java.sh \
    40-less.sh \
    40-ls.sh \
    40-macports.sh \
    40-notmuch.sh \
    40-pager.sh \
    40-scala.sh \
    90-home-bin.sh \
    $(NULL)

TARGET_DIR := ~/.config/profile

$(TARGET_DIR):
	install -d $(TARGET_DIR)

$(TARGET_DIR)/%.sh: %.sh
	install -t $(TARGET_DIR) $^

.PHONY: install
install: $(addprefix $(TARGET_DIR)/,$(TARGETS))
