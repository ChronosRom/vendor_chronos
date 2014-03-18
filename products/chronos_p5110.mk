# Check for target product
ifeq (ioap_p5110,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_p51xx

# PAC device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ioap/overlay/ioap/mdpi

#  
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/common/bootlogo/ioap_logo_720x1280.rle:root/logo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/720x1280/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/p5110/cm.mk)

PRODUCT_NAME := ioap_p5110

endif
