#
# Set default values for local vars.
#
ifeq ($(strip $(LOCAL_MODULE)),)
    LOCAL_MODULE := $(patsubst %/,%,$(dir $(LOCAL_MODULE_MAKEFILE)))
endif

#
# Check for errors in LOCAL_MODULE_MAKEFILE.
#
ifeq ($(LOCAL_INSTALL_DIR),)
    $(error "$(LOCAL_PATH) does not define LOCAL_INSTALL_DIR")
endif

#
# Collect local module into master lists.
#
HOME_ALL_MODULES += $(LOCAL_MODULE)
install: install-$(LOCAL_MODULE)

#
# Generate install rules.
#
.PHONY: install-$(LOCAL_MODULE)

$(LOCAL_INSTALL_DIR): PRIVATE_INSTALL_DIR := $(LOCAL_INSTALL_DIR)
$(LOCAL_INSTALL_DIR): PRIVATE_INSTALL_DIR_MODE := $(LOCAL_INSTALL_DIR_MODE)
$(LOCAL_INSTALL_DIR):
	@echo $(PRIVATE_INSTALL_DIR) :: create -m $(PRIVATE_INSTALL_DIR_MODE)
	@install -d \
	    $(if $(PRIVATE_INSTALL_DIR_MODE),-m $(PRIVATE_INSTALL_DIR_MODE),) \
	    $(PRIVATE_INSTALL_DIR)

install-$(LOCAL_MODULE): PRIVATE_FILES := $(LOCAL_FILES)
install-$(LOCAL_MODULE): PRIVATE_INSTALL_DIR := $(LOCAL_INSTALL_DIR)
install-$(LOCAL_MODULE): PRIVATE_INSTALL_DIR_MODE := $(LOCAL_INSTALL_DIR_MODE)
install-$(LOCAL_MODULE): PRIVATE_INSTALL_METHOD := $(LOCAL_INSTALL_METHOD)
install-$(LOCAL_MODULE): PRIVATE_MODULE := $(LOCAL_MODULE)
install-$(LOCAL_MODULE): PRIVATE_MODULE_MAKEFILE := $(LOCAL_MODULE_MAKEFILE)
install-$(LOCAL_MODULE): PRIVATE_PATH := $(LOCAL_PATH)
install-$(LOCAL_MODULE): PRIVATE_RSYNC_EXCLUDES := $(LOCAL_RSYNC_EXCLUDES)
install-$(LOCAL_MODULE): PRIVATE_RSYNC_NO_DELETE := $(LOCAL_RSYNC_NO_DELETE)
install-$(LOCAL_MODULE): $(PRIVATE_INSTALL_DIR)

ifeq ($(LOCAL_INSTALL_METHOD),files)
install-$(LOCAL_MODULE): $(addprefix $(LOCAL_INSTALL_DIR)/,$(LOCAL_FILES))

$(LOCAL_INSTALL_DIR)/%: PRIVATE_INSTALL_DIR := $(LOCAL_INSTALL_DIR)
$(LOCAL_INSTALL_DIR)/%: $(LOCAL_PATH)/%
	@echo "$(PRIVATE_INSTALL_DIR) <= $^"
	@install -t $(PRIVATE_INSTALL_DIR) $^
else
ifeq ($(LOCAL_INSTALL_METHOD),rsync)
install-$(LOCAL_MODULE):
	@rsync \
	    --out-format="$(PRIVATE_INSTALL_DIR) <= %n%L" \
	    --archive \
	    $(if $(PRIVATE_RSYNC_NO_DELETE),,--delete) \
	    --exclude=.git \
	    --exclude=.gitignore \
	    --exclude=Home.mk \
	    $(addprefix --exclude=,$(PRIVATE_RSYNC_EXCLUDES)) \
	    $(PRIVATE_PATH)/ $(PRIVATE_INSTALL_DIR)/
else
$(error "$(LOCAL_PATH) has invalid LOCAL_INSTALL_DIR='$(LOCAL_INSTALL_DIR)'")
endif
endif
