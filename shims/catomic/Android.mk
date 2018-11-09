LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := atomic_shim.c
LOCAL_MULTILIB := both
LOCAL_MODULE := libatomic_shim
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := libcutils
include $(BUILD_SHARED_LIBRARY)
