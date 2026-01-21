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
PRODUCT_BRAND := OnePlus
ifndef PRODUCT_MODEL
PRODUCT_MODEL := OnePlus Ace 6T
endif
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

# Set the Build Fingerprint directly
BUILD_FINGERPRINT := oneplus/macan/macan:16/BP2A.250605.015/1767156396771:user/release-keys

# Set the Build Description directly (Handles spaces correctly)
BUILD_DESC := qssi-user 16 BP2A.250605.015 1767156396771 release-keys

# Only use Overrides for properties that don't have special variable support
# If you don't have other overrides, you can leave this variable empty or remove it.
# PRODUCT_BUILD_PROP_OVERRIDES += \
#    TARGET_DEVICE=macan \
#    PRODUCT_NAME=macan

PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false
PRODUCT_ENFORCE_VINTF_MANIFEST := false

PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := gz
