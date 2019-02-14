$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Some AOSP things
$(call inherit-product, vendor/aosp/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/htc/htc_v36bml_dugl/device.mk)

# Release name
PRODUCT_RELEASE_NAME := Desire 628 dual sim

PRODUCT_DEVICE := htc_v36bml_dugl
PRODUCT_NAME := full_htc_v36bml_dugl
PRODUCT_BRAND := HTC
PRODUCT_MODEL := Desire 628 dual sim
PRODUCT_MANUFACTURER := HTC
PRODUCT_RESTRICT_VENDOR_FILES := false

# Boot animation
TARGET_SCREEN_HEIGHT      := 1280
TARGET_SCREEN_WIDTH       := 720
TARGET_BOOTANIMATION_NAME := 720

PRODUCT_DEFAULT_LANGUAGE := en
PRODUCT_DEFAULT_REGION   := US
