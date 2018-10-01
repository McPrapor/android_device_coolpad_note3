LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := htcxlog_shim.c
LOCAL_MULTILIB := both
LOCAL_MODULE := libhtcxlog_shim
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES += system/core/liblog/include/
LOCAL_SHARED_LIBRARIES := liblog
include $(BUILD_SHARED_LIBRARY)
