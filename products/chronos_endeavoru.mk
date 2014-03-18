# Check for target product
ifeq (ioap_endeavoru,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi
# Add bluefa1con bootanim
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/720x1280/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/htc/endeavoru/cm.mk)

PRODUCT_NAME := ioap_endeavoru

endif
