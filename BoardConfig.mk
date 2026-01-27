#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/oneplus/macan

# 1. Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv9-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_VARIANT := generic

# 2. Bootloader
PRODUCT_PLATFORM := canoe
TARGET_BOOTLOADER_BOARD_NAME := canoe
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := sm8845

# 3. Kernel & Boot Image
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_USES_RECOVERY_AS_BOOT := false

BOARD_PAGE_SIZE := 4096
BOARD_BOOT_HEADER_VERSION := 4
BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_VENDOR_BOOT_HEADER_VERSION := 4

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE)

BOARD_VENDOR_BOOT_MKBOOTIMG_ARGS += --header_version $(BOARD_VENDOR_BOOT_HEADER_VERSION)
BOARD_VENDOR_BOOT_MKBOOTIMG_ARGS += --pagesize $(BOARD_PAGE_SIZE)

TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := device/oneplus/macan/prebuilts/kernel
TARGET_PREBUILT_DTB := device/oneplus/macan/prebuilts/dtb.img
BOARD_PREBUILT_DTBOIMAGE := device/oneplus/macan/prebuilts/dtbo.img

BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_RAMDISK_USE_LZ4 := true

BOARD_BOOTCONFIG := androidboot.hardware=qcom
BOARD_BOOTCONFIG += androidboot.memcg=1
BOARD_BOOTCONFIG += androidboot.usbcontroller=a600000.dwc3
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true
BOARD_BOOTCONFIG += androidboot.hypervisor.protected_vm.supported=true
BOARD_BOOTCONFIG += androidboot.hypervisor.version=gunyah
BOARD_BOOTCONFIG += androidboot.vendor.qspa=true
BOARD_BOOTCONFIG += androidboot.serialconsole=0
BOARD_BOOTCONFIG += androidboot.selinux=permissive
BOARD_BOOTCONFIG += buildvariant=userdebug

BOARD_KERNEL_CMDLINE := video=vfb:640x400,bpp=32,memsize=3072000 log_buf_len=2M nosoftlockup qcom_geni_serial.con_enabled=0

# 4. Path Mappings
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm

# 5. Partitions
BOARD_SUPER_PARTITION_SIZE := 16231956480
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 16227762176

BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    odm \
    system_dlkm

BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600

# 6. File Systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

# 7. A/B Configuration
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot dtbo init_boot odm product recovery system system_dlkm system_ext vendor vendor_boot vendor_dlkm vbmeta vbmeta_system vbmeta_vendor

# 8. Verified Boot (AVB)
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_VENDOR := vendor vendor_dlkm odm
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 3

# 9. Kernel Modules
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)/prebuilts/modules/*.ko)

# --- CRITICAL: Power & USB (Enable ADB) ---
RECOVERY_MODULES_LOAD := \
    qcom-pon.ko \
    qcom-spmi-pmic.ko \
    qcom-spmi-temp-alarm.ko \
    qti_glink_charger.ko \
    oplus_chg_v2.ko \
    dwc3-msm.ko \
    phy-msm-ssusb-qmp.ko \
    phy-qcom-eusb2-repeater.ko \
    phy-generic.ko \
    ucsi_qti_glink.ko

# --- DISPLAY & GRAPHICS ---
RECOVERY_MODULES_LOAD += \
    msm_drm.ko \
    drm_display_helper.ko \
    oplus_bsp_dft_kernel_fb.ko \
    oplus_bsp_dft_olc.ko \
    qpnp_smb5_main.ko \
    qpnp_smb5_charger.ko

# --- TOUCHSCREEN & SENSORS (From OrangeFox) ---
RECOVERY_MODULES_LOAD += \
    oplus_bsp_synaptics_tcm2.ko \
    oplus_bsp_tp_common.ko \
    oplus_bsp_tp_custom.ko \
    oplus_bsp_tp_focal_common.ko \
    oplus_bsp_tp_ft3518.ko \
    oplus_bsp_tp_ft3658u_spi.ko \
    oplus_bsp_tp_ft3681.ko \
    oplus_bsp_tp_ft3683g.ko \
    oplus_bsp_tp_ft8057p.ko \
    oplus_bsp_tp_goodix_comnon.ko \
    oplus_bsp_tp_gt9916.ko \
    oplus_bsp_tp_gt9966.ko \
    oplus_bsp_tp_ilitek7807s.ko \
    oplus_bsp_tp_ilitek_common.ko \
    oplus_bsp_tp_notify.ko \
    oplus_bsp_tp_novatek_common.ko \
    oplus_bsp_tp_nt36528_noflash.ko \
    oplus_bsp_tp_nt36532_noflash.ko \
    oplus_bsp_tp_nt36672c_noflash.ko \
    oplus_bsp_tp_syna_common.ko \
    oplus_bsp_tp_tcm_S3908.ko \
    oplus_bsp_tp_tcm_S3910.ko \
    oplus_bsp_tp_td4377_noflash.ko \
    q6_pdr_dlkm.ko \
    q6_notifier_dlkm.ko \
    snd_event_dlkm.ko \
    gpr_dlkm.ko \
    spf_core_dlkm.ko \
    adsp_loader_dlkm.ko \
    stm_st54se_gpio.ko \
    nxp-nci.ko

# Apply the list to Recovery Ramdisk
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := $(RECOVERY_MODULES_LOAD)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(RECOVERY_MODULES_LOAD)
