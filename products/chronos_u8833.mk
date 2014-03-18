# Check for target product
ifeq (ioap_u8833,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_hdpi

# PAC device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ioap/overlay/ioap/hdpi_480x800

#  
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/common/bootlogo/ioap_logo_480x800.rle:root/initlogo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/480x800/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/huawei/u8833/cm.mk)

PRODUCT_NAME := ioap_u8833

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/ioap/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/ioap/tools/addprojects.py $(PRODUCT_NAME))

endif
