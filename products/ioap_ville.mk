# Check for target product
ifeq (ioap_ville,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

# Add bluefa1con bootanim
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/540x960/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/htc/ville/cm.mk)

PRODUCT_NAME := ioap_ville

endif
