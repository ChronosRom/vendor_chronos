# Check for target product
ifeq (ioap_e610,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_mdpi

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/320x480/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/lge/e610/cm.mk)

PRODUCT_NAME := ioap_e610

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/ioap/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/ioap/tools/addprojects.py $(PRODUCT_NAME))

endif
