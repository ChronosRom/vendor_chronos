# Check for target product
ifeq (ioap_n8013,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_n80xx

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/1280x800/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/n8013/cm.mk)

PRODUCT_NAME := ioap_n8013

endif
