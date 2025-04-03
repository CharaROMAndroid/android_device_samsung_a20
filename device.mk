# Copyright (C) 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Inherit common device configuration
$(call inherit-product, device/samsung/exynos7885-common/exynos7885-common.mk)

# Inherit proprietary files setup
$(call inherit-product, vendor/samsung/a20/a20-vendor.mk)

# Inherit dalvik config
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Display resolution
TARGET_SCREEN_HEIGHT := 1560
TARGET_SCREEN_WIDTH := 720

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(LOCAL_PATH)
