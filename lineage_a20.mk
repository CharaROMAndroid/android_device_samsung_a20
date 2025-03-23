# Copyright (C) 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/a20/device.mk)

BUILD_FINGERPRINT := "samsung/a20ub/a20:11/RP1A.200720.012/A205GUBU9CUF4:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
   PRIVATE_BUILD_DESC="a20ub-user 11 RP1A.200720.012 A205GUBU9CUF4 release-keys"

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a20
PRODUCT_NAME := lineage_a20
PRODUCT_MODEL := SM-A205F
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
