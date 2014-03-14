# use AOSP default sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Themos.ogg \
    ro.config.notification_sound=Proxima.ogg \
    ro.config.alarm_alert=Cesium.ogg

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/common/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh \
    vendor/ioap/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/ioap/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh

# T-Mobile theme engine
include vendor/ioap/config/themes_common.mk

# Screen recorder
PRODUCT_PACKAGES += \
    libscreenrecorder \
    ScreenRecorder

# init.d support
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/ioap/prebuilt/common/etc/helpers.sh:system/etc/helpers.sh \
    vendor/ioap/prebuilt/common/etc/init.d.cfg:system/etc/init.d.cfg \
    vendor/ioap/prebuilt/common/etc/init.d/00check:system/etc/init.d/00check \
    vendor/ioap/prebuilt/common/etc/init.d/01zipalign:system/etc/init.d/01zipalign \
    vendor/ioap/prebuilt/common/etc/init.d/02sysctl:system/etc/init.d/02sysctl \
    vendor/ioap/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/ioap/prebuilt/common/etc/init.d/05freemem:system/etc/init.d/05freemem \
    vendor/ioap/prebuilt/common/etc/init.d/06removecache:system/etc/init.d/06removecache \
    vendor/ioap/prebuilt/common/etc/init.d/07fixperms:system/etc/init.d/07fixperms \
    vendor/ioap/prebuilt/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/ioap/prebuilt/common/etc/init.d/10sdboost:system/etc/init.d/10sdboost \
    vendor/ioap/prebuilt/common/etc/init.d/11battery:system/etc/init.d/11battery \
    vendor/ioap/prebuilt/common/etc/init.d/12touch:system/etc/init.d/12touch \
    vendor/ioap/prebuilt/common/etc/init.d/13minfree:system/etc/init.d/13minfree \
    vendor/ioap/prebuilt/common/etc/init.d/14gpurender:system/etc/init.d/14gpurender \
    vendor/ioap/prebuilt/common/etc/init.d/15sleepers:system/etc/init.d/15sleepers \
    vendor/ioap/prebuilt/common/etc/init.d/16journalism:system/etc/init.d/16journalism \
    vendor/ioap/prebuilt/common/etc/init.d/17sqlite3:system/etc/init.d/17sqlite3 \
    vendor/ioap/prebuilt/common/etc/init.d/18wifisleep:system/etc/init.d/18wifisleep \
    vendor/ioap/prebuilt/common/etc/init.d/19iostats:system/etc/init.d/19iostats \
    vendor/ioap/prebuilt/common/etc/init.d/20setrenice:system/etc/init.d/20setrenice \
    vendor/ioap/prebuilt/common/etc/init.d/21tweaks:system/etc/init.d/21tweaks \
    vendor/ioap/prebuilt/common/etc/init.d/24speedy_modified:system/etc/init.d/24speedy_modified \
    vendor/ioap/prebuilt/common/etc/init.d/25loopy_smoothness_tweak:system/etc/init.d/25loopy_smoothness_tweak \
    vendor/ioap/prebuilt/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/ioap/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# Added xbin files
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/common/xbin/zip:system/xbin/zip \
    vendor/ioap/prebuilt/common/xbin/zipalign:system/xbin/zipalign

# OmniRom Packages
PRODUCT_PACKAGES += \
    OmniSwitch

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/ioap/overlay/ioap/common

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
#    vendor/ioap/CHANGELOG.mkdn:system/etc/IOAP-CHANGELOG.txt \
    vendor/ioap/CONTRIBUTORS.mkdn:system/etc/IOAP-CONTRIBUTORS.txt

# AOKP Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/ioap/overlay/aokp/common

# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(TARGET_PRODUCT)

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

# ParanoidAndroid Proprietary
PRODUCT_COPY_FILES += \
    vendor/ioap/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/ioap/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

# ParanoidAndroid Preferences
PA_PREF_FILES := $(wildcard vendor/ioap/prebuilt/pa/preferences/$(PA_CONF_SOURCE)/*.xml)
PRODUCT_COPY_FILES += \
    $(foreach f,$(PA_PREF_FILES),$(f):system/etc/paranoid/preferences/$(notdir $(f)))

BOARD := $(subst IOAP_,,$(TARGET_PRODUCT))

# Add CM release version
CM_RELEASE := true
CM_BUILD := $(BOARD)

# Add PA release version
PA_VERSION_MAJOR = 4
PA_VERSION_MINOR = 0
PA_VERSION_MAINTENANCE =
PA_PREF_REVISION = BETA4
VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)
PA_VERSION := pa_$(BOARD)-$(VERSION)-$(shell date +%0d%^b%Y-%H%M%S)

# IOAP version
IOAP_VERSION_MAJOR = v3.52
# IOAP_VERSION_MINOR = 
# IOAP_VERSION_MAINTENANCE = Beta 3
IOAP_VERSION := $(IOAP_VERSION_MAJOR)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ioap.version=$(IOAP_VERSION) \
    ro.infamous.version=$(BOARD)_$(IOAP_VERSION)_$(shell date +%Y%m%d-%H%M%S) \
    ro.modversion=$(PA_VERSION) \
    ro.pa.family=$(PA_CONF_SOURCE) \
    ro.pa.version=$(VERSION) \
    ro.papref.revision=$(PA_PREF_REVISION) \
    ro.aokp.version=$(BOARD)_kitkat


