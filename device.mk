#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oneplus/macan

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

DEVICE_MANIFEST_FILE := device/oneplus/macan/vintf/manifest.xml
DEVICE_MANIFEST_FILE += $(wildcard device/oneplus/macan/vintf/fragments/*.xml)
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := device/oneplus/macan/vintf/framework_compatibility_matrix.xml

# Fastbootd & OTA Tools (Keep these, they are required for Lineage Recovery)
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd \
    update_engine \
    update_engine_sideload \
    update_verifier \
    checkpoint_gc \
    otapreopt_script

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Partitions - FSTAB COPY (CRITICAL FIX)
# This places fstab where Recovery expects it
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/fstab.qcom

PRODUCT_COPY_FILES += \
    device/oneplus/macan/prebuilts/dtb.img:$(PRODUCT_OUT)/dtb.img

# --- COMMENTED OUT FOR RECOVERY DEBUGGING ---
# These scripts conflict with Lineage Recovery's own init process.
# Only enable these later when you are building the full ROM (system.img).
#
# PRODUCT_PACKAGES += \
#    init.qcom.rc \
#    init.qcom.usb.rc \
#    init.target.rc \
#    init.recovery.qcom.rc \
#    ueventd.qcom.rc \
#    vendor_modprobe.sh \
#    ... (rest of your sh/rc files)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/oneplus/macan/macan-vendor.mk)
