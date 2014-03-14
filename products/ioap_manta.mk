# Check for target product
ifeq (ioap_manta,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_manta

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/2560x1600/bootanimation.zip:system/media/bootanimation.zip

# include ParanoidAndroid common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/manta/cm.mk)

PRODUCT_NAME := ioap_manta

endif
