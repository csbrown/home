LOCAL_PATH := $(call my-dir)
include $(HOME_CLEAR_VARS)

LOCAL_INSTALL_DIR := ~/.local/share/applications
LOCAL_INSTALL_METHOD := files
LOCAL_FILES := gtk-redshift.desktop
include $(HOME_INSTALL_MODULE)
