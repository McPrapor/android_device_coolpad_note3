LOCAL_PATH:= $(call my-dir)

# libcutils
include $(CLEAR_VARS)
LOCAL_SRC_FILES := atomic.c
LOCAL_WHOLE_STATIC_LIBRARIES := libcutils
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_MODULE := libc_util
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
