# Check for target product
ifeq (ioap_find5,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xxhdpi

#  
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/common/bootlogo/ioap_logo_1080x1920.rle:root/logo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/1080x1920/bootanimation.zip:system/media/bootanimation.zip

# include ParanoidAndroid common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/oppo/find5/cm.mk)

PRODUCT_NAME := ioap_find5

endif
