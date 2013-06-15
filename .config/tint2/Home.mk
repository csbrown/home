LOCAL_PATH := $(call my-dir)
include $(HOME_CLEAR_VARS)

LOCAL_INSTALL_DIR := ~/.config/tint2
LOCAL_INSTALL_METHOD := rsync
include $(HOME_INSTALL_MODULE)
