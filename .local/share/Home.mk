SUBDIRS := \
    applications \
    $(NULL)

.PHONY: install
install: $(TARGET_DIR) $(addprefix $(TARGET_DIR)/,$(TARGETS))
	@for i in $(SUBDIRS); do \
	    make -C $$i -f Home.mk install; \
	done
