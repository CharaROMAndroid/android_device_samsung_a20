# Copyright (C) 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Device overlays take precedence over inherited common defaults.
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Inherit common device configuration
$(call inherit-product, device/samsung/exynos7885-common/exynos7885-common.mk)

# Inherit proprietary files setup
$(call inherit-product, vendor/samsung/a20/a20-vendor.mk)

# Inherit dalvik config
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Target Info
TARGET_DEVICE := a20
TARGET_SOC := exynos7884B

# Bootanimation
TARGET_SCREEN_HEIGHT := 1560
TARGET_SCREEN_WIDTH := 720

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.samsung

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# FM radio
# TODO: Re-enable when Royna's eureka_fm_legacy source is available.
# PRODUCT_PACKAGES += \
#     S5E7885FMRadio \
#     miku.dayo.hardware.fmradio-service

# Overlay
# Requires the matching Wifi module resource/migration patch and fork manifest entry.
PRODUCT_PACKAGES += A20WifiOverlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH) \
    hardware/samsung_slsi/scsc_wifibt/wpa_supplicant_lib

# Extend ueventd through its existing ODM import without replacing common rules.
PRODUCT_COPY_FILES += \
    device/samsung/a20/rootdir/etc/ueventd.rc:$(TARGET_COPY_OUT_ODM)/etc/ueventd.rc

# Select the BPF variants supported by the legacy kernel backports.
PRODUCT_PRODUCT_PROPERTIES += ro.bpf.kver_override=5.10.239

# Skip optional shader priming on the legacy graphics stack.
PRODUCT_SYSTEM_EXT_PROPERTIES += service.sf.prime_shader_cache=0
