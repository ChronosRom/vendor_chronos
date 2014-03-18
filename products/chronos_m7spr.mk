# Check for target product
ifeq (ioap_m7spr,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xxhdpi

# Add bluefa1con bootanim
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/1080x1920/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/htc/m7spr/cm.mk)

PRODUCT_NAME := ioap_m7spr

endif
