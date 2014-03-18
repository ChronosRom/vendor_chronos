# Check for target product
ifeq (chronos_mako,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_nav_xhdpi

#  
PRODUCT_COPY_FILES += \
    vendor/chronos/prebuilt/common/bootlogo/ioap_logo_720x1280.rle:root/logo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/chronos/prebuilt/720x1280/bootanimation.zip:system/media/bootanimation.zip

# include Chronos common configuration
include vendor/chronos/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/lge/mako/cm.mk)

PRODUCT_NAME := chronos_mako

endif
