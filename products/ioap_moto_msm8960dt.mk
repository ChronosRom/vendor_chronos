# Check for target product
ifeq (ioap_moto_msm8960dt,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_nav_xhdpi

# PAC device overlay
#$(shell cp -f vendor/ioap/prebuilt/common/bootanimation_framework/android-logo-mask_motorola-xhdpi.png frameworks/base/core/res/assets/images/android-logo-mask.png)

#  
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/common/bootlogo/ioap_logo_720x1280.rle:root/logo.rle

# Copy bootanimation
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/720x1280/bootanimation.zip:system/media/bootanimation.zip

# include PAC common configuration
include vendor/ioap/config/ioap_common.mk

# Inherit CM device configuration
$(call inherit-product, device/motorola/moto_msm8960dt/cm.mk)

PRODUCT_NAME := ioap_moto_msm8960dt

# Update local_manifest.xml
GET_PROJECT_RMS := $(shell vendor/ioap/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/ioap/tools/addprojects.py $(PRODUCT_NAME))

endif
