LOCAL_PATH := device/htc/htc_v36bml_dugl

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

## Custom shims
PRODUCT_PACKAGES += \
    libmtkshim_log \
    libmtkshim_audio \
    libmtkshim_ui \
    libmtkshim_gui \
    libmtkshim_omx \
    libmtkshim_camera \
    libmtkshim_gps \
    libhtcxlog_shim \
    libmtkshim_atomic

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
    $(LOCAL_PATH)/configs/mddb/BPLGUInfoCustomAppSrcP_MT6735_S00_0_1524V28P45_0504_0422_1_1_lwg_n:system/vendor/etc/mddb/BPLGUInfoCustomAppSrcP_MT6735_S00_0_1524V28P45_0504_0422_1_1_lwg_n \
    $(LOCAL_PATH)/configs/mddb/DbgInfo_LR9.W1444.MD.LWTG.MP_MT6735_V36BML_0_1524V28P45_0504_0422_1_2016_04_22_15_26_1_lwg_n:system/vendor/etc/mddb/DbgInfo_LR9.W1444.MD.LWTG.MP_MT6735_V36BML_0_1524V28P45_0504_0422_1_2016_04_22_15_26_1_lwg_n

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

## Fingerprint
#PRODUCT_PACKAGES += \
#    android.hardware.biometrics.fingerprint@2.1-service

#PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

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

# Display
PRODUCT_PACKAGES += \
    libion

# Gralloc
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.renderscript@1.0-impl

# HW Composer
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service

# Light HAL
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

# VibratorHAL
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# UsbHAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service \
    libcurl

PRODUCT_COPY_FILES += \
    device/htc/htc_v36bml_dugl/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

# Include explicitly to work around Facelock issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# FMRadio
PRODUCT_PACKAGES += \
    libfmjni \
    FMRadio

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs

# exFAT
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

# NTFS
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

# Sensor Calibration
PRODUCT_PACKAGES += \
    libem_sensor_jni

# Audio Settings
PRODUCT_PACKAGES += \
    libaudio_volume_jni

# Audio
PRODUCT_PACKAGES += \
    audio_policy.default \
    audio.r_submix.default \
    audio.a2dp.default \
    audio.usb.default \
    libtinyalsa \
    libtinycompress \
    libtinymix \
    libtinyxml \
    SoundRecorder

PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.soundtrigger@2.0-impl

PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:/system/vendor/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:/system/vendor/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:/system/vendor/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:/system/vendor/etc/usb_audio_policy_configuration.xml

# Codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/vendor/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/vendor/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/vendor/etc/media_codecs_google_video_le.xml

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true
    
# Configs
PRODUCT_COPY_FILES += \
    device/htc/htc_v36bml_dugl/configs/apns-conf.xml:system/etc/apns-conf.xml \
    device/htc/htc_v36bml_dugl/configs/ecc_list.xml:system/etc/ecc_list.xml \
    device/htc/htc_v36bml_dugl/configs/spn-conf.xml:system/etc/spn-conf.xml

# Messaging
PRODUCT_PACKAGES += \
    messaging
    
# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    lib_driver_cmd_mt66xx \
    libwpa_client \
    hostapd \
    wificond \
    wifilogd \
    wpa_supplicant

PRODUCT_COPY_FILES += \
    device/htc/htc_v36bml_dugl/configs/wifi/wpa_supplicant.conf:system/vendor/etc/wifi/wpa_supplicant.conf \
    device/htc/htc_v36bml_dugl/configs/wifi/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf \
    device/htc/htc_v36bml_dugl/configs/wifi/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.wificountrycode=00    

# ThemeInterfacer
PRODUCT_PACKAGES += \
    ThemeInterfacer

# Eleven
PRODUCT_PACKAGES += \
    Eleven

# WallpaperPicker
PRODUCT_PACKAGES += \
    WallpaperPicker

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Jelly
PRODUCT_PACKAGES += \
    Jelly

# OmniStyle
PRODUCT_PACKAGES += \
    OmniStyle

# OmniJaws
PRODUCT_PACKAGES += \
    OmniJaws

# WiFi Display
# this property enables the user to access Google WFD settings.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1

# SELinux
#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.build.selinux=1

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Google properties overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    net.tethering.noprovisioning=true

# HTC build props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc
#    ro.build.fingerprint=htc/v36bml_dugl_00401/htc_v36bml_dugl:5.1/LMY47D/822405.2:user/release-keys \
#    ro.build.buildline=V36BMLDUGL_HTC_WWE_L51_CRC_DesireSense70_Stable
    
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT := htc/v36bml_dugl_00401/htc_v36bml_dugl:5.1/LMY47D/822405.2:user/release-keys \
    PRIVATE_BUILD_DESC="1.17.401.2 CL822405 release-keys" \
    PRODUCT_NAME=v36bml_dugl_00401
#    ro.com.google.clientidbase=android-htc \
#    ro.build.fingerprint=htc/v36bml_dugl_00401/htc_v36bml_dugl:5.1/LMY47D/822405.2:user/release-keys \
#    ro.build.buildline=V36BMLDUGL_HTC_WWE_L51_CRC_DesireSense70_Stable \
#    ro.build.description="1.17.401.2" "CL822405" "release-keys"

# Some more apps
#PRODUCT_PACKAGES += \
#    Terminal \
#    Email \
#    ExactCalculator \
#    Gallery2 \
#    MusicFX
PRODUCT_PACKAGES += \
    Terminal \
    Email \
    ExactCalculator \
    MusicFX


# Vendor
$(call inherit-product, vendor/htc/htc_v36bml_dugl/htc_v36bml_dugl-vendor.mk)
$(call inherit-product, vendor/htc/htc_v36bml_dugl/htc_v36bml_dugl-firmware-blobs.mk)
