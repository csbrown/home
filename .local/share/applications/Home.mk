LOCAL_PATH := $(call my-dir)
include $(HOME_CLEAR_VARS)

LOCAL_INSTALL_DIR := ~/.local/share/applications
LOCAL_INSTALL_METHOD := rsync
LOCAL_RSYNC_NO_DELETE := true
include $(HOME_INSTALL_MODULE)
