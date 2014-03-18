# use AOSP default sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Themos.ogg \
    ro.config.notification_sound=Proxima.ogg \
    ro.config.alarm_alert=Cesium.ogg

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/chronos/prebuilt/common/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh \
    vendor/chronos/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/chronos/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh

# T-Mobile theme engine
include vendor/chronos/config/themes_common.mk

# Screen recorder
PRODUCT_PACKAGES += \
    libscreenrecorder \
    ScreenRecorder

# init.d support
PRODUCT_COPY_FILES += \
    vendor/chronos/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/chronos/prebuilt/common/etc/helpers.sh:system/etc/helpers.sh \
    vendor/chronos/prebuilt/common/etc/init.d.cfg:system/etc/init.d.cfg \
    vendor/chronos/prebuilt/common/etc/init.d/00check:system/etc/init.d/00check \
    vendor/chronos/prebuilt/common/etc/init.d/01zipalign:system/etc/init.d/01zipalign \
    vendor/chronos/prebuilt/common/etc/init.d/02sysctl:system/etc/init.d/02sysctl \
    vendor/chronos/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/chronos/prebuilt/common/etc/init.d/05freemem:system/etc/init.d/05freemem \
    vendor/chronos/prebuilt/common/etc/init.d/06removecache:system/etc/init.d/06removecache \
    vendor/chronos/prebuilt/common/etc/init.d/07fixperms:system/etc/init.d/07fixperms \
    vendor/chronos/prebuilt/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/chronos/prebuilt/common/etc/init.d/10sdboost:system/etc/init.d/10sdboost \
    vendor/chronos/prebuilt/common/etc/init.d/11battery:system/etc/init.d/11battery \
    vendor/chronos/prebuilt/common/etc/init.d/12touch:system/etc/init.d/12touch \
    vendor/chronos/prebuilt/common/etc/init.d/13minfree:system/etc/init.d/13minfree \
    vendor/chronos/prebuilt/common/etc/init.d/14gpurender:system/etc/init.d/14gpurender \
    vendor/chronos/prebuilt/common/etc/init.d/15sleepers:system/etc/init.d/15sleepers \
    vendor/chronos/prebuilt/common/etc/init.d/16journalism:system/etc/init.d/16journalism \
    vendor/chronos/prebuilt/common/etc/init.d/17sqlite3:system/etc/init.d/17sqlite3 \
    vendor/chronos/prebuilt/common/etc/init.d/18wifisleep:system/etc/init.d/18wifisleep \
    vendor/chronos/prebuilt/common/etc/init.d/19iostats:system/etc/init.d/19iostats \
    vendor/chronos/prebuilt/common/etc/init.d/20setrenice:system/etc/init.d/20setrenice \
    vendor/chronos/prebuilt/common/etc/init.d/21tweaks:system/etc/init.d/21tweaks \
    vendor/chronos/prebuilt/common/etc/init.d/24speedy_modified:system/etc/init.d/24speedy_modified \
    vendor/chronos/prebuilt/common/etc/init.d/25loopy_smoothness_tweak:system/etc/init.d/25loopy_smoothness_tweak \
    vendor/chronos/prebuilt/common/etc/init.d/98tweaks:system/etc/init.d/98tweaks \
    vendor/chronos/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# Added xbin files
PRODUCT_COPY_FILES += \
    vendor/chronos/prebuilt/common/xbin/zip:system/xbin/zip \
    vendor/chronos/prebuilt/common/xbin/zipalign:system/xbin/zipalign

# OmniRom Packages
PRODUCT_PACKAGES += \
    OmniSwitch

# Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/chronos/overlay/chronos/common

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
#    vendor/chronos/CHANGELOG.mkdn:system/etc/Chronos-CHANGELOG.txt \
    vendor/chronos/CONTRIBUTORS.mkdn:system/etc/Chronos-CONTRIBUTORS.txt

# AOKP Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/chronos/overlay/aokp/common

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
    vendor/chronos/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/chronos/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

# ParanoidAndroid Preferences
PA_PREF_FILES := $(wildcard vendor/chronos/prebuilt/pa/preferences/$(PA_CONF_SOURCE)/*.xml)
PRODUCT_COPY_FILES += \
    $(foreach f,$(PA_PREF_FILES),$(f):system/etc/paranoid/preferences/$(notdir $(f)))

BOARD := $(subst CHRONOS_,,$(TARGET_PRODUCT))

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

# Chronos version
CHRONOS_VERSION_MAJOR = v1.00
CHRONOS_VERSION_MINOR = 
CHRONOS_VERSION_MAINTENANCE = Beta 3
CHRONOS_VERSION := $(CHRONOS_VERSION_MAJOR)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.chronos.version=$(CHRONOS_VERSION) \
    ro.infamous.version=$(BOARD)_$(CHRONOS_VERSION)_$(shell date +%Y%m%d-%H%M%S) \
    ro.modversion=$(PA_VERSION) \
    ro.pa.family=$(PA_CONF_SOURCE) \
    ro.pa.version=$(VERSION) \
    ro.papref.revision=$(PA_PREF_REVISION) \
    ro.aokp.version=$(BOARD)_kitkat


