LOCAL_PATH := $(call my-dir)
include $(HOME_CLEAR_VARS)

LOCAL_INSTALL_DIR := ~/.config/git
LOCAL_INSTALL_METHOD := rsync
LOCAL_RSYNC_EXCLUDES := local
include $(HOME_INSTALL_MODULE)
