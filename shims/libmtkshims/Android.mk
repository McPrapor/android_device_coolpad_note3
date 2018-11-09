LOCAL_PATH := $(call my-dir)

# atomic symbols
    include $(CLEAR_VARS)
    LOCAL_SRC_FILES := atomic.cpp
    LOCAL_MODULE := libmtkshim_atomic
    LOCAL_PROPRIETARY_MODULE := true
    LOCAL_C_INCLUDES += system/core/libcutils/include/
    include $(BUILD_SHARED_LIBRARY)

# mtk log symbols (xlog)
ifeq ($(TARGET_INCLUDE_XLOG_SYMBOLS),true)
    include $(CLEAR_VARS)

    LOCAL_SRC_FILES := xlog.c
    LOCAL_SHARED_LIBRARIES := liblog
    LOCAL_MODULE := libmtkshim_log
    LOCAL_PROPRIETARY_MODULE := true

    include $(BUILD_SHARED_LIBRARY)
endif

# audio symbols
ifeq ($(TARGET_INCLUDE_AUDIO_SYMBOLS),true)
    include $(CLEAR_VARS)

    LOCAL_SRC_FILES := audio.cpp
    LOCAL_MODULE := libmtkshim_audio
    LOCAL_PROPRIETARY_MODULE := true

    include $(BUILD_SHARED_LIBRARY)
endif

# ui symbols
ifeq ($(TARGET_INCLUDE_UI_SYMBOLS),true)
    include $(CLEAR_VARS)

    LOCAL_SRC_FILES := ui.cpp
    LOCAL_SHARED_LIBRARIES := libui
    LOCAL_MODULE := libmtkshim_ui
    LOCAL_PROPRIETARY_MODULE := true

    include $(BUILD_SHARED_LIBRARY)
endif

# gui symbols
ifeq ($(TARGET_INCLUDE_GUI_SYMBOLS),true)
    include $(CLEAR_VARS)

    LOCAL_SRC_FILES := gui.cpp
    LOCAL_SHARED_LIBRARIES := libgui
    LOCAL_MODULE := libmtkshim_gui
    LOCAL_PROPRIETARY_MODULE := true

    include $(BUILD_SHARED_LIBRARY)
endif

# omx symbols
ifeq ($(TARGET_INCLUDE_OMX_SYMBOLS),true)
    include $(CLEAR_VARS)

    LOCAL_SRC_FILES := omx.cpp
    LOCAL_MODULE := libmtkshim_omx
    LOCAL_PROPRIETARY_MODULE := true

    include $(BUILD_SHARED_LIBRARY)
endif


ifeq ($(TARGET_INCLUDE_CAMERA_SYMBOLS),true)
    include $(CLEAR_VARS)

    LOCAL_SRC_FILES := camera.cpp
    LOCAL_SHARED_LIBRARIES := libdpframework
    LOCAL_MODULE := libmtkshim_camera
    LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_SHARED_LIBRARY)
endif
