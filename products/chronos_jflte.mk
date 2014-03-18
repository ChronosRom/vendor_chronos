# Check for target product
ifeq (chronos_jflte,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xxhdpi

#  
PRODUCT_COPY_FILES += \
    vendor/chronos/prebuilt/common/bootlogo/pac_logo_1080x1920.rle:root/logo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/chronos/prebuilt/1080x1920/bootanimation.zip:system/media/bootanimation.zip

# include chronos common configuration
include vendor/chronos/config/chronos_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/jflte/cm.mk)

PRODUCT_NAME := chronos_jflte

endif
