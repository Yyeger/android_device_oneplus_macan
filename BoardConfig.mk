#
# Copyright (C) 2021-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Partitions
BOARD_SUPER_PARTITION_SIZE := 16231956480

# Include the common OEM chipset BoardConfig.
include device/oneplus/sm8845-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/macan

# Assert Only chinese versione for now
TARGET_OTA_ASSERT_DEVICE := OP6117L1

# Display
TARGET_SCREEN_DENSITY := 560

# Kernel
TARGET_KERNEL_ADDITIONAL_FLAGS += CONFIG_MACAN_DTB=y

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery TODO
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 120

# Include the proprietary files BoardConfig.
include vendor/oneplus/macan/BoardConfigVendor.mk
