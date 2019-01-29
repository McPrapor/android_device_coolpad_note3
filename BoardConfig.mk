# mt6753 platform boardconfig
LOCAL_PATH := device/coolpad/note3

# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true

# Display
USE_OPENGL_RENDERER := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# HWC2 by default
TARGET_USES_HWC2 := true
VSYNC_EVENT_PHASE_OFFSET_NS := -8000000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := -8000000
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0

BOARD_EGL_CFG := device/coolpad/note3/configs/egl.cfg

# Vold
TARGET_KERNEL_HAVE_EXFAT := true

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Wifi
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P

WIFI_DRIVER_STATE_CTRL_PARAM	 := "/dev/wmtWifi"
WIFI_DRIVER_STATE_ON		 := 1
WIFI_DRIVER_STATE_OFF		 := 0

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# Recovery
# Currently broken
#RECOVERY_VARIANT := twrp

# TWRP
ifeq ($(RECOVERY_VARIANT), twrp)
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
TW_NO_REBOOT_BOOTLOADER := true
TW_THEME := portrait_hdpi
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_MAX_BRIGHTNESS := 255
BOARD_SUPPRESS_SECURE_ERASE := true
TW_INCLUDE_CRYPTO := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_NO_USB_STORAGE := true
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
TARGET_DISABLE_TRIPLE_BUFFERING := false
TW_USE_TOOLBOX := true
TW_INCLUDE_NTFS_3G := true
else
# CWM
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
endif

# SELinux
BOARD_SEPOLICY_DIRS := \
    vendor/mad/sepolicy

# DEXPREOPT
ifneq ($(TARGET_BUILD_VARIANT),user)
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := true
endif

# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6753
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true

# CPU
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

TARGET_CPU_CORTEX_A53 := true

TARGET_BOOTLOADER_BOARD_NAME := mt6735

TARGET_USES_NON_TREBLE_CAMERA := true

# Kernel
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --base 0x40078000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x03f88000 --second_offset 0x00e88000 --tags_offset 0x0df88000 --board 1479347649
TARGET_KERNEL_SOURCE := kernel/coolpad/note3
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CONFIG := abyrvalg_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
MTK_APPENDED_DTB_SUPPORT := yes
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
LZMA_RAMDISK_TARGETS := boot,recovery
BOARD_USES_FULL_RECOVERY_IMAGE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26839875584 # 26840399872 - 524288
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

#audio
TARGET_HAS_PRE_N_AUDIO := true

# Display
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.mt6735
# TWRP-specific
ifeq ($(RECOVERY_VARIANT), twrp)
DEVICE_RESOLUTION := 720x1280
DEVICE_SCREEN_WIDTH := 720
DEVICE_SCREEN_HEIGHT := 1280
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
endif

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# SELinux
BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy

# FIX updater_script
TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)/releasetools.py


#SHIMS
TARGET_INCLUDE_XLOG_SYMBOLS := false
TARGET_INCLUDE_AUDIO_SYMBOLS := true
TARGET_INCLUDE_UI_SYMBOLS := true
TARGET_INCLUDE_GUI_SYMBOLS := true
TARGET_INCLUDE_CAMERA_SYMBOLS := true

# Include symbols
# Shim libraries
# Add to PRODUCT_PACKAGES at device.mk

TARGET_LD_SHIM_LIBS := \
    $(TARGET_LD_SHIM_LIBS) \
    /system/lib/libcutils.so|libmtkshim_atomic.so \
    /system/lib64/libcutils.so|libmtkshim_atomic.so \
    /system/lib/liblog.so|libhtcxlog_shim.so \
    /system/lib64/liblog.so|libhtcxlog_shim.so \
    /system/vendor/lib/hw/audio.primary.mt6735.so|libmtkshim_audio.so \
    /system/vendor/lib64/hw/audio.primary.mt6735.so|libmtkshim_audio.so \
    /system/vendor/lib/hw/audio.primary.mt6753.so|libmtkshim_audio.so \
    /system/vendor/lib64/hw/audio.primary.mt6753.so|libmtkshim_audio.so \
    /system/lib/libui.so|libmtkshim_ui.so \
    /system/lib64/libui.so|libmtkshim_ui.so \
    /system/lib/libgui.so|libmtkshim_gui.so \
    /system/lib64/libgui.so|libmtkshim_gui.so \
    /system/vendor/lib/libfeatureio.so|libmtkshim_camera.so \
    /system/vendor/lib64/libfeatureio.so|libmtkshim_camera.so \
    /system/vendor/lib/libcam.camnode.so|libmtkshim_camera.so \
    /system/vendor/lib64/libcam.camnode.so|libmtkshim_camera.so \
    /system/vendor/lib/libcam.hal3a.v3.so|libmtkshim_camera.so \
    /system/vendor/lib64/libcam.hal3a.v3.so|libmtkshim_camera.so

#    /system/vendor/lib/hw/audio.primary.$(TARGET_BOARD_PLATFORM).so|libmtkshim_audio.so \
#    /system/vendor/lib64/hw/audio.primary.$(TARGET_BOARD_PLATFORM).so|libmtkshim_audio.so \

# RIL
TARGET_RIL_VARIANT := ../../../hardware/coolpad/note3/ril
TARGET_RILUTILS_VARIANT := ../../../hardware/ril/librilutils
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
BOARD_RIL_CLASS := ../../../device/coolpad/note3/ril
BOARD_CONNECTIVITY_MODULE := conn_soc
BOARD_PROVIDES_LIBRIL := true
BOARD_PROVIDES_RILD := true
BOARD_USES_RIL_UNSOL_PENDING := true
BOARD_USES_MTK_HARDWARE := true
#TARGET_LD_SHIM_LIBS := $(TARGET_LD_SHIM_LIBS):/system/lib/mtk-ril.so|libmtk-ril_shim.so:/system/lib64/mtk-ril.so|libmtk-ril_shim.so
