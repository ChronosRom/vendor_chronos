# Check for target product
ifeq (ioap_villec2,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

# Add bluefa1con bootanim
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/540x960/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/htc/villec2/cm.mk)

PRODUCT_NAME := ioap_villec2

endif
