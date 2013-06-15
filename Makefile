include _build/core.mk
include $(shell $(HOME_BUILD_SYSTEM)/findleaves.py \
                  --prune=out \
                  --prune=.repo \
                  --prune=.git \
                  . \
                  Home.mk)
