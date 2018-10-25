LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := mtk-ril_shim.c
LOCAL_MULTILIB := both
LOCAL_MODULE := libmtk-ril_shim
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES += system/core/liblog/include/
LOCAL_SHARED_LIBRARIES := liblog
LOCAL_CFLAGS := -D_GNU_SOURCE
include $(BUILD_SHARED_LIBRARY)
