LOCAL_PATH := $(call my-dir)/taro
include $(HOME_CLEAR_VARS)

LOCAL_MODULE := opt/taro
LOCAL_INSTALL_DIR := ~/opt/taro
LOCAL_INSTALL_METHOD := rsync
include $(HOME_INSTALL_MODULE)
