# Check for target product
ifeq (ioap_tf700t,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_tf700t
# PAC device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ioap/overlay/ioap/mdpi

# PA device overlay
#PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/pa_tf700t

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/1920x1200/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/asus/tf700t/cm.mk)

PRODUCT_NAME := ioap_tf700t

endif
