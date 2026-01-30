#
# Copyright (C) 2021-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2800
TARGET_SCREEN_WIDTH := 1272


# Display Configs (OnePlus Macan) Seems like we are dealing with different screen panels in the same rom dump, let's try to add support for all of them:
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/displayconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946850534658451.xml \
    $(LOCAL_PATH)/configs/display/displayconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946916234099603.xml \
    $(LOCAL_PATH)/configs/display/displayconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630947039571902850.xml \
    $(LOCAL_PATH)/configs/display/displayconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630947039571902851.xml \
    $(LOCAL_PATH)/configs/display/displayconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630947075271898515.xml

# LiveDisplay
$(call soong_config_set,OPLUS_LINEAGE_LIVEDISPLAY_HAL,ENABLE_AF,true)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    FrameworksResTargetEuicc \
    OPlusFrameworksResTarget \
    OPlusSettingsProviderResTarget \
    OPlusSettingsResTarget \
    OPlusSystemUIResTarget

# these are all the packages found:
./my_product/app/OplusCamera/OplusCamera.apk
./my_product/overlay/OplusConfigOverlayComms/OplusConfigOverlayComms.apk
./my_product/overlay/oplus_framework_res_rro_oneplus.apk
./my_stock/app/OplusAudioMonitor/OplusAudioMonitor.apk
./my_stock/app/OplusOperationManual/OplusOperationManual.apk
./my_stock/app/OplusPhoneActivation/OplusPhoneActivation.apk
./my_stock/app/OplusSecurityKeyboard/OplusSecurityKeyboard.apk
./my_stock/del-app/OplusDocumentsReader/OplusDocumentsReader.apk
./my_stock/del-app/OplusEmail/OplusEmail.apk
./my_stock/del-app/OplusQuickGame/OplusQuickGame.apk
./my_stock/overlay/OplusFwkResOverlay/OplusFwkResOverlay.apk
./my_stock/overlay/OplusSystemuiResOverlay/OplusSystemuiResOverlay.apk
./my_stock/priv-app/KeKeOplusThemeStore-CN/KeKeOplusThemeStore-CN.apk
./my_stock/priv-app/OplusBootReg/OplusBootReg.apk
./my_stock/priv-app/OplusGames/OplusGames.apk
./my_stock/priv-app/OplusScreenRecorder/OplusScreenRecorder.apk
./my_stock/priv-app/OplusThirdKit/OplusThirdKit.apk
./product/overlay/OplusCarrierConfig.apk
./system_ext/app/OplusAtlasService/OplusAtlasService.apk
./system_ext/app/OplusCommercialEngineerCamera/OplusCommercialEngineerCamera.apk
./system_ext/app/OplusCommercialEngineerMode/OplusCommercialEngineerMode.apk
./system_ext/app/OplusEngineerNetwork/OplusEngineerNetwork.apk
./system_ext/app/OplusEyeProtect/OplusEyeProtect.apk
./system_ext/app/OplusFlexibleWindowUI/OplusFlexibleWindowUI.apk
./system_ext/app/OplusGestureUI/OplusGestureUI.apk
./system_ext/app/OplusLocationService/OplusLocationService.apk
./system_ext/app/OplusMediaController/OplusMediaController.apk
./system_ext/app/OplusMultiApp/OplusMultiApp.apk
./system_ext/app/OplusQualityProtect/OplusQualityProtect.apk
./system_ext/framework/oplus-framework-res.apk
./system_ext/overlay/OplusBluetoothResource.apk
./system_ext/overlay/OplusFrameworkBluetoothResource.apk
./system_ext/overlay/OplusPermissionControllerOverlay/OplusPermissionControllerOverlay.apk
./system_ext/overlay/OplusWifiResource.apk
./system_ext/priv-app/OplusAppPlatform/OplusAppPlatform.apk
./system_ext/priv-app/OplusExSystemService/OplusExSystemService.apk
./system_ext/priv-app/OplusLauncher/OplusLauncher.apk
./system_ext/priv-app/OplusNearComm/OplusNearComm.apk
./system_ext/priv-app/OplusNrMode/OplusNrMode.apk
./system_ext/priv-app/OplusVirtualComm/OplusVirtualComm.apk

# Power
$(call soong_config_set,qtipower,mode_ext_lib,power-ext-oplus)

# PowerShare
PRODUCT_PACKAGES += \
    vendor.lineage.powershare-service.oplus

# Regional properties TODO
# To start only work on Chinese Ace 6T
# However that file is empty, this is not good!
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/24855/build.default.prop:$(TARGET_COPY_OUT_ODM)/etc/24855//build.default.prop 
#    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/***/build.EU.prop:$(TARGET_COPY_OUT_ODM)/etc/***/build.EU.prop \
#    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/***/build.IN.prop:$(TARGET_COPY_OUT_ODM)/etc/***/build.IN.prop \
#    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/***/build.NA.prop:$(TARGET_COPY_OUT_ODM)/etc/***/build.NA.prop \
#    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/***/build.default.prop:$(TARGET_COPY_OUT_ODM)/etc/***/build.default.prop

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Telephony
PRODUCT_PACKAGES += \
#    OplusEsimSwitcher \ no esim for the chinese variant
#    OplusEuicc

# no euicc found, only found these:
./odm/etc/permissions/android.hardware.nfc.uicc.xml
./vendor/etc/permissions/android.hardware.nfc.uicc.xml
./vendor/etc/permissions/android.hardware.se.omapi.uicc.xml


PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml

# Touch features
$(call soong_config_set,OPLUS_LINEAGE_TOUCH_HAL,ENABLE_GM,true)
$(call soong_config_set,OPLUS_LINEAGE_TOUCH_HAL,ENABLE_HTPR,false)

# Vibrator
$(call soong_config_set,OPLUS_LINEAGE_VIBRATOR_HAL,USE_EFFECT_STREAM,true)

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/oneplus/sm8845-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/oneplus/macan/macan-vendor.mk)
