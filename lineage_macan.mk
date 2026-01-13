#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from macan device
$(call inherit-product, device/oplus/macan/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := macan
PRODUCT_NAME := lineage_macan
PRODUCT_BRAND := oplus
PRODUCT_MODEL := macan
PRODUCT_MANUFACTURER := oplus

PRODUCT_GMS_CLIENTID_BASE := android-oplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="qssi-user 16 BP2A.250605.015 1767156396771 release-keys" \
    BuildFingerprint := oplus/macan/macan:16/BP2A.250605.015/1767156396771:user/release-keys