LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := atomic.cpp
LOCAL_MULTILIB := both
LOCAL_MODULE := libshim_atomic
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := -O3 -Wno-unused-variable -Wno-unused-parameter
include $(BUILD_SHARED_LIBRARY)
