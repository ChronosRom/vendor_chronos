# Check for target product
ifeq (ioap_flo,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_flo

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/1200x1920/bootanimation.zip:system/media/bootanimation.zip

# include ParanoidAndroid common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/asus/flo/cm.mk)

PRODUCT_NAME := ioap_flo

endif
