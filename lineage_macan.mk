#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from macan device
$(call inherit-product, device/oneplus/macan/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := macan
PRODUCT_NAME := lineage_macan
PRODUCT_BRAND := oneplus
PRODUCT_MODEL := macan
PRODUCT_MANUFACTURER := oneplus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

# Define the Fingerprint separately
BUILD_FINGERPRINT := oneplus/macan/macan:16/BP2A.250605.015/1767156396771:user/release-keys

# Use the overrides correctly (note PRIVATE_BUILD_DESC instead of BuildDesc)
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="qssi-user 16 BP2A.250605.015 1767156396771 release-keys"
