# Check for target product
ifeq (ioap_steelhead,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_steelhead

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/xxhdpi/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/google/steelhead/cm.mk)

PRODUCT_NAME := ioap_steelhead

endif
