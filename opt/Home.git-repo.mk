LOCAL_PATH := $(call my-dir)/git-repo
include $(HOME_CLEAR_VARS)

LOCAL_MODULE := opt/git-repo
LOCAL_INSTALL_DIR := ~/opt/git-repo
LOCAL_INSTALL_METHOD := rsync
include $(HOME_INSTALL_MODULE)
