LOCAL_PATH := device/coolpad/note3

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

## Custom shims
#PRODUCT_PACKAGES += \
#    libhtcxlog_shim \
#    libatomic_shim

# Manifest
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/manifest.xml:system/vendor/manifest.xml

# Lights
PRODUCT_PACKAGES += \
    lights.mt6753

PRODUCT_PACKAGES += \
    fingerprint.default

# MDDB
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mddb/BPLGUInfoCustomAppSrcP_MT6735_S00_0_1524V28P45_0504_0422_1_1_lwg_n:system/etc/mddb/BPLGUInfoCustomAppSrcP_MT6735_S00_0_1524V28P45_0504_0422_1_1_lwg_n \
    $(LOCAL_PATH)/configs//mddb/DbgInfo_LR9.W1444.MD.LWTG.MP_MT6735_V36BML_0_1524V28P45_0504_0422_1_2016_04_22_15_26_1_lwg_n:system/etc/mddb/DbgInfo_LR9.W1444.MD.LWTG.MP_MT6735_V36BML_0_1524V28P45_0504_0422_1_2016_04_22_15_26_1_lwg_n

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_device.xml:system/vendor/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:system/vendor/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:/system/vendor/etc/a2dp_audio_policy_configuration.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/vendor/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_codecs_mediatek_video.xml:system/vendor/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/vendor/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/vendor/etc/media_profiles.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.mt6735:root/fstab.mt6735 \
    $(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/init.mt6735.rc:root/init.mt6735.rc \
    $(LOCAL_PATH)/rootdir/init.mt6735.usb.rc:root/init.mt6735.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.mt6735.rc:root/ueventd.mt6735.rc

# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:system/vendor/etc/seccomp_policy/mediaextractor.policy \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:system/vendor/etc/seccomp_policy/mediacodec.policy

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

## Common stuff
#$(call inherit-product, vendor/mad/config/common.mk)

# RIL
PRODUCT_PACKAGES += \
   libccci_util \
   libril \
   rild
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.telephony.ril_class=MT6753 \
    ro.telephony.ril.config=fakeiccid \
    ro.com.android.mobiledata=false

# Vendor
$(call inherit-product, vendor/coolpad/note3/note3-vendor.mk)
$(call inherit-product, vendor/coolpad/note3/note3-firmware-blobs.mk)
