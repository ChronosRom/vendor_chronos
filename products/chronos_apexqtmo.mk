# Check for target product
ifeq (ioap_apexqtmo,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

#  
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/common/bootlogo/ioap_logo_720x1280.rle:root/logo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/720x1280/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/apexqtmo/cm.mk)

PRODUCT_NAME := ioap_apexqtmo

endif
