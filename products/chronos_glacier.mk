# Check for target product
ifeq (ioap_glacier,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_glacier

# PAC device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/ioap/overlay/ioap/common

#  
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/common/bootlogo/ioap_logo_480x800.rle:root/GIO.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/480x800/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/htc/glacier/cm.mk)

PRODUCT_NAME := ioap_glacier

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/ioap/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/ioap/tools/addprojects.py $(PRODUCT_NAME))

endif
