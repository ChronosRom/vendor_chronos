# Check for target product
ifeq (chronos_hercules,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

#  
PRODUCT_COPY_FILES += \
    vendor/chronos/prebuilt/common/bootlogo/ioap_logo_480x800.rle:root/logo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/chronos/prebuilt/480x800/bootanimation.zip:system/media/bootanimation.zip

# include Chronos common configuration
include vendor/chronos/config/chronos_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/hercules/cm.mk)

PRODUCT_NAME := chronos_hercules

endif
