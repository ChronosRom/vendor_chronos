# Check for target product
ifeq (ioap_pollux_windy,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_pollux

# PAC device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ioap/overlay/ioap/common

#  
#PRODUCT_COPY_FILES += \
#   vendor/ioap/prebuilt/common/bootlogo/ioap_logo_1080x1920.rle:root/logo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/1080x1920/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/sony/pollux_windy/cm.mk)

PRODUCT_NAME := ioap_pollux_windy

endif

