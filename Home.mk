LOCAL_PATH := $(call my-dir)
include $(HOME_CLEAR_VARS)

LOCAL_MODULE := dotfiles
LOCAL_INSTALL_DIR := ~
LOCAL_INSTALL_METHOD := files
LOCAL_FILES := \
    .bash_completion \
    .bash_profile \
    .bashrc \
    .ctags \
    .gvimrc \
    .hgrc \
    .hgignore \
    .inputrc \
    .mailcap \
    .rpmmacros \
    .vimrc
include $(HOME_INSTALL_MODULE)

include $(call first-makefiles-under,$(LOCAL_PATH))
