# Check for target product
ifeq (ioap_evita,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_evita

#  
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/720x1280/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/htc/evita/cm.mk)

PRODUCT_NAME := ioap_evita

endif
