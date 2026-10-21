include hardware/qcom-caf/common/build/core/vendor/qcom_boards.mk

UM_4_4_FAMILY := msm8998 sdm660
UM_4_9_FAMILY := msm8917 msm8937 msm8952 msm8953 msm8996 sdm845
UM_4_14_FAMILY := $(MSMNILE) $(MSMSTEPPE) $(TRINKET) $(ATOLL)
UM_4_19_FAMILY := $(KONA) $(LITO) $(BENGAL)
UM_5_4_FAMILY := $(LAHAINA) $(HOLI)
UM_5_10_FAMILY := $(TARO) $(PARROT)
UM_5_15_FAMILY := $(KALAMA) $(CROW)
UM_6_1_FAMILY := $(PINEAPPLE) $(VOLCANO)
UM_6_6_FAMILY := $(SUN)

UM_PLATFORMS := $(UM_4_4_FAMILY) $(UM_4_9_FAMILY) $(UM_4_14_FAMILY) $(UM_4_19_FAMILY) $(UM_5_4_FAMILY) $(UM_5_10_FAMILY) $(UM_5_15_FAMILY) $(UM_6_1_FAMILY) $(UM_6_6_FAMILY)
QSSI_SUPPORTED_PLATFORMS := $(UM_4_4_FAMILY) $(UM_4_9_FAMILY) $(UM_4_14_FAMILY) $(UM_4_19_FAMILY) $(UM_5_4_FAMILY) $(UM_5_10_FAMILY) $(UM_5_15_FAMILY) $(UM_6_1_FAMILY) $(UM_6_6_FAMILY)
UM_NO_GKI_PLATFORMS := $(UM_4_4_FAMILY) $(UM_4_9_FAMILY) $(UM_4_14_FAMILY) $(UM_4_19_FAMILY) $(UM_5_4_FAMILY)

# Disable thermal HAL netlink framework on UM platforms that do not support it
ifneq ($(filter $(LEGACY_UM_PLATFORMS),$(TARGET_BOARD_PLATFORM)),)
    $(call soong_config_set,qti_thermal,netlink,false)
endif

BOARD_USES_ADRENO := true

# Add qtiaudio to soong config namespaces
SOONG_CONFIG_NAMESPACES += qtiaudio

# Add supported variables to qtiaudio config
SOONG_CONFIG_qtiaudio += \
    feature_ext_amplifier \
    feature_extended_compress_format \
    feature_gef_support \
    feature_gki \
    feature_hal_v7 \
    feature_instance_id \
    feature_sound_trigger

# Set default values for qtiaudio config
SOONG_CONFIG_qtiaudio_feature_ext_amplifier ?= false
SOONG_CONFIG_qtiaudio_feature_extended_compress_format ?= false
SOONG_CONFIG_qtiaudio_feature_gef_support ?= false
SOONG_CONFIG_qtiaudio_feature_gki ?= false
SOONG_CONFIG_qtiaudio_feature_hal_v7 ?= false
SOONG_CONFIG_qtiaudio_feature_instance_id ?= false
SOONG_CONFIG_qtiaudio_feature_sound_trigger ?= false

ifeq ($(AUDIO_FEATURE_ENABLED_EXT_AMPLIFIER),true)
    SOONG_CONFIG_qtiaudio_feature_ext_amplifier := true
endif

ifeq ($(AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT),true)
    SOONG_CONFIG_qtiaudio_feature_extended_compress_format := true
endif

ifeq ($(AUDIO_FEATURE_ENABLED_GEF_SUPPORT),true)
    SOONG_CONFIG_qtiaudio_feature_gef_support := true
endif

ifeq ($(AUDIO_FEATURE_ENABLED_GKI),true)
    SOONG_CONFIG_qtiaudio_feature_gki := true
endif

ifeq ($(AUDIO_FEATURE_ENABLED_HAL_V7), true)
    SOONG_CONFIG_qtiaudio_feature_hal_v7 := true
endif

ifeq ($(AUDIO_FEATURE_ENABLED_INSTANCE_ID),true)
    SOONG_CONFIG_qtiaudio_feature_instance_id := true
endif

ifeq ($(BOARD_SUPPORTS_SOUND_TRIGGER),true)
    SOONG_CONFIG_qtiaudio_feature_sound_trigger := true
endif

ifeq ($(BOARD_SUPPORTS_SOUND_TRIGGER_HAL),true)
    SOONG_CONFIG_qtiaudio_feature_sound_trigger := true
endif

# Add qtidisplay to soong config namespaces
SOONG_CONFIG_NAMESPACES += qtidisplay

# Add supported variables to qtidisplay config
SOONG_CONFIG_qtidisplay += \
    drmpp \
    headless \
    llvmsa \
    gralloc4 \
    udfps \
    displayconfig_enabled \
    default \
    gralloc_handle_has_reserved_size \
    gralloc_handle_has_custom_content_md_reserved_size \
    master_side_cp \
    shift_horizontal \
    shift_vertical \
    smmu_proxy \
    ubwcp_headers \
    var1 \
    var2 \
    var3 \
    wide_color \
    target_kernel_version \
    target_no_raw10_custom_format \
    target_uses_unaligned_nv21_zsl \
    target_uses_unaligned_ycrcb \
    target_uses_ycrcb_camera_preview \
    target_uses_ycrcb_venus_camera_preview

# Set default values for qtidisplay config
SOONG_CONFIG_qtidisplay_drmpp ?= false
SOONG_CONFIG_qtidisplay_headless ?= false
SOONG_CONFIG_qtidisplay_llvmsa ?= false
SOONG_CONFIG_qtidisplay_gralloc4 ?= false
SOONG_CONFIG_qtidisplay_udfps ?= false
SOONG_CONFIG_qtidisplay_displayconfig_enabled ?= false
SOONG_CONFIG_qtidisplay_default ?= true
SOONG_CONFIG_qtidisplay_shift_horizontal ?= 0
SOONG_CONFIG_qtidisplay_shift_vertical ?= 0
SOONG_CONFIG_qtidisplay_gralloc_handle_has_reserved_size ?= false
SOONG_CONFIG_qtidisplay_gralloc_handle_has_custom_content_md_reserved_size ?= false
SOONG_CONFIG_qtidisplay_master_side_cp ?= false
SOONG_CONFIG_qtidisplay_smmu_proxy ?= false
SOONG_CONFIG_qtidisplay_ubwcp_headers ?= false
SOONG_CONFIG_qtidisplay_var1 ?= false
SOONG_CONFIG_qtidisplay_var2 ?= false
SOONG_CONFIG_qtidisplay_var3 ?= false
SOONG_CONFIG_qtidisplay_wide_color ?= false
SOONG_CONFIG_qtidisplay_target_kernel_version ?= 0
SOONG_CONFIG_qtidisplay_target_no_raw10_custom_format ?= false
SOONG_CONFIG_qtidisplay_target_uses_unaligned_nv21_zsl ?= false
SOONG_CONFIG_qtidisplay_target_uses_unaligned_ycrcb ?= false
SOONG_CONFIG_qtidisplay_target_uses_ycrcb_camera_preview ?= false
SOONG_CONFIG_qtidisplay_target_uses_ycrcb_venus_camera_preview ?= false

# For libgrallocutils features
ifeq ($(TARGET_NO_RAW10_CUSTOM_FORMAT),true)
    SOONG_CONFIG_qtidisplay_target_no_raw10_custom_format := true
endif

ifeq ($(TARGET_USES_UNALIGNED_NV21_ZSL),true)
    SOONG_CONFIG_qtidisplay_target_uses_unaligned_nv21_zsl := true
endif

ifeq ($(TARGET_USES_UNALIGNED_YCRCB),true)
    SOONG_CONFIG_qtidisplay_target_uses_unaligned_ycrcb := true
endif

ifeq ($(TARGET_USES_YCRCB_CAMERA_PREVIEW),true)
    SOONG_CONFIG_qtidisplay_target_uses_ycrcb_camera_preview := true
else ifeq ($(TARGET_USES_YCRCB_VENUS_CAMERA_PREVIEW),true)
    SOONG_CONFIG_qtidisplay_target_uses_ycrcb_venus_camera_preview := true
endif

ifneq ($(TARGET_DISPLAY_SHIFT_HORIZONTAL),)
    SOONG_CONFIG_qtidisplay_shift_horizontal := $(TARGET_DISPLAY_SHIFT_HORIZONTAL)
endif

ifneq ($(TARGET_DISPLAY_SHIFT_VERTICAL),)
    SOONG_CONFIG_qtidisplay_shift_vertical := $(TARGET_DISPLAY_SHIFT_VERTICAL)
endif

ifeq ($(TARGET_HAS_WIDE_COLOR_DISPLAY), true)
    SOONG_CONFIG_qtidisplay_wide_color := true
endif

# FOD
ifeq ($(TARGET_USES_FOD_ZPOS),true)
    SOONG_CONFIG_qtidisplay_udfps := true
endif

# UM platforms no longer need this set on O+
ifneq ($(call is-board-platform-in-list, $(UM_PLATFORMS)),true)
    TARGET_USES_QCOM_BSP := true
endif

# Tell HALs that we're compiling an AOSP build with an in-line kernel
TARGET_COMPILE_WITH_MSM_KERNEL := true

# Allow building audio encoders
TARGET_USES_QCOM_MM_AUDIO := true

# Enable color metadata for all UM targets
ifeq ($(call is-board-platform-in-list, $(UM_PLATFORMS)),true)
    TARGET_USES_COLOR_METADATA := true
endif

# Enable DRM PP driver on UM platforms that support it
ifeq ($(call is-board-platform-in-list, $(UM_4_9_FAMILY) $(UM_4_14_FAMILY) $(UM_4_19_FAMILY) $(UM_5_4_FAMILY) $(UM_5_10_FAMILY) $(UM_5_15_FAMILY) $(UM_6_1_FAMILY) $(UM_6_6_FAMILY)),true)
    SOONG_CONFIG_qtidisplay_drmpp := true
    TARGET_USES_DRM_PP := true
endif

TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS ?= 0

# Mark GRALLOC_USAGE_EXTERNAL_DISP as valid gralloc bit
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS += | (1 << 13)

# Mark GRALLOC_USAGE_PRIVATE_WFD as valid gralloc bit
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS += | (1 << 21)

# Mark GRALLOC_USAGE_PRIVATE_HEIF_VIDEO as valid gralloc bit on UM platforms that support it
ifneq ($(filter $(UM_4_9_FAMILY) $(UM_4_14_FAMILY) $(UM_4_19_FAMILY) $(UM_5_4_FAMILY) $(UM_5_10_FAMILY) $(UM_5_15_FAMILY) $(UM_6_1_FAMILY) $(UM_6_6_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS += | (1 << 27)
endif

# Enable displayconfig
ifeq ($(call is-board-platform-in-list, $(UM_5_10_FAMILY) $(UM_5_15_FAMILY) $(UM_6_1_FAMILY) $(UM_6_6_FAMILY)),true)
    SOONG_CONFIG_qtidisplay_displayconfig_enabled := true
endif

# Enable gralloc handle support on 5.10
ifeq ($(call is-board-platform-in-list, $(UM_5_10_FAMILY) $(UM_5_15_FAMILY) $(UM_6_1_FAMILY) $(UM_6_6_FAMILY)),true)
    SOONG_CONFIG_qtidisplay_gralloc_handle_has_reserved_size := true
endif

# Enable Gralloc4 on UM platforms that support it
ifneq ($(filter $(UM_4_14_FAMILY) $(UM_4_19_FAMILY) $(UM_5_4_FAMILY) $(UM_5_10_FAMILY) $(UM_5_15_FAMILY) $(UM_6_1_FAMILY) $(UM_6_6_FAMILY),$(PRODUCT_BOARD_PLATFORM)),)
    SOONG_CONFIG_qtidisplay_gralloc4 := true
endif

# Enable SMMU proxy on UM platforms that support it
ifneq ($(filter $(UM_6_1_FAMILY) $(UM_6_6_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    SOONG_CONFIG_qtidisplay_smmu_proxy := true
endif

# Expose UBWCP headers to UM platforms that require it
ifneq ($(filter $(UM_6_1_FAMILY) $(UM_6_6_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    SOONG_CONFIG_qtidisplay_ubwcp_headers := true
endif

# Enable master side content protection on UM platforms that support it
MASTER_SIDE_CP_TARGET_LIST := msm8996 $(UM_4_4_FAMILY) $(UM_4_9_FAMILY) $(UM_4_14_FAMILY) $(UM_4_19_FAMILY)
ifneq ($(filter $(MASTER_SIDE_CP_TARGET_LIST),$(TARGET_BOARD_PLATFORM)),)
    SOONG_CONFIG_qtidisplay_master_side_cp := true
endif

# Use full QTI gralloc struct for GKI 2.0 targets
ifneq ($(filter $(UM_5_10_FAMILY) $(UM_5_15_FAMILY) $(UM_6_1_FAMILY) $(UM_6_6_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    TARGET_GRALLOC_HANDLE_HAS_CUSTOM_CONTENT_MD_RESERVED_SIZE ?= true
    TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE ?= true
else
    TARGET_GRALLOC_HANDLE_HAS_CUSTOM_CONTENT_MD_RESERVED_SIZE ?= false
    TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE ?= false
endif

# Opt-in for old rmnet_data driver
ifeq ($(filter $(UM_5_15_FAMILY) $(UM_6_1_FAMILY) $(UM_6_6_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    $(call soong_config_set,rmnetctl,old_rmnet_data,true)
endif

# Use QTI gralloc UBWCP struct
ifneq ($(filter $(UM_6_1_FAMILY) $(UM_6_6_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    TARGET_GRALLOC_HANDLE_HAS_UBWCP_FORMAT ?= true
else
    TARGET_GRALLOC_HANDLE_HAS_UBWCP_FORMAT ?= false
endif

$(call soong_config_set,qtidisplay,gralloc_handle_has_custom_content_md_reserved_size,$(TARGET_GRALLOC_HANDLE_HAS_CUSTOM_CONTENT_MD_RESERVED_SIZE))
$(call soong_config_set,qtidisplay,gralloc_handle_has_reserved_size,$(TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE))
$(call soong_config_set,qtidisplay,gralloc_handle_has_ubwcp_format,$(TARGET_GRALLOC_HANDLE_HAS_UBWCP_FORMAT))

# Every qcom platform is considered a vidc target
MSM_VIDC_TARGET_LIST := $(PRODUCT_BOARD_PLATFORM)

ifeq ($(call is-board-platform-in-list, $(UM_4_4_FAMILY)),true)
    QCOM_HARDWARE_VARIANT := msm8998
else ifeq ($(call is-board-platform-in-list, $(UM_4_9_FAMILY)),true)
    QCOM_HARDWARE_VARIANT := sdm845
else ifeq ($(call is-board-platform-in-list, $(UM_4_14_FAMILY)),true)
    QCOM_HARDWARE_VARIANT := sm8150
else ifeq ($(call is-board-platform-in-list, $(UM_4_19_FAMILY)),true)
    QCOM_HARDWARE_VARIANT := sm8250
else ifeq ($(call is-board-platform-in-list, $(UM_5_4_FAMILY)),true)
    QCOM_HARDWARE_VARIANT := sm8350
else ifeq ($(call is-board-platform-in-list, $(UM_5_10_FAMILY)),true)
    QCOM_HARDWARE_VARIANT := sm8450
else ifeq ($(call is-board-platform-in-list, $(UM_5_15_FAMILY)),true)
    QCOM_HARDWARE_VARIANT := sm8550
else ifeq ($(call is-board-platform-in-list, $(UM_6_1_FAMILY)),true)
    QCOM_HARDWARE_VARIANT := sm8650
else ifeq ($(call is-board-platform-in-list, $(UM_6_6_FAMILY)),true)
    QCOM_HARDWARE_VARIANT := sm8750
else
    QCOM_HARDWARE_VARIANT := $(PRODUCT_BOARD_PLATFORM)
endif

# Allow a device to manually override which HALs it wants to use
ifneq ($(OVERRIDE_QCOM_HARDWARE_VARIANT),)
QCOM_HARDWARE_VARIANT := $(OVERRIDE_QCOM_HARDWARE_VARIANT)
endif

ifeq ($(call is-board-platform-in-list, $(UM_4_4_FAMILY)),true)
    TARGET_KERNEL_VERSION := 4.4
else ifeq ($(call is-board-platform-in-list, $(UM_4_9_FAMILY)),true)
    TARGET_KERNEL_VERSION := 4.9
else ifeq ($(call is-board-platform-in-list, $(UM_4_14_FAMILY)),true)
    TARGET_KERNEL_VERSION := 4.14
else ifeq ($(call is-board-platform-in-list, $(UM_4_19_FAMILY)),true)
    TARGET_KERNEL_VERSION := 4.19
else ifeq ($(call is-board-platform-in-list, $(UM_5_4_FAMILY)),true)
    TARGET_KERNEL_VERSION := 5.4
else ifeq ($(call is-board-platform-in-list, $(UM_5_10_FAMILY)),true)
    TARGET_KERNEL_VERSION := 5.10
else ifeq ($(call is-board-platform-in-list, $(UM_5_15_FAMILY)),true)
    TARGET_KERNEL_VERSION := 5.15
else ifeq ($(call is-board-platform-in-list, $(UM_6_1_FAMILY)),true)
    TARGET_KERNEL_VERSION := 6.1
else ifeq ($(call is-board-platform-in-list, $(UM_6_6_FAMILY)),true)
    TARGET_KERNEL_VERSION := 6.6
endif

# Required for frameworks/native
ifeq ($(call is-board-platform-in-list, $(UM_PLATFORMS)),true)
    TARGET_USES_QCOM_UM_FAMILY := true
endif

# Allow a device to opt-out hardset of PRODUCT_SOONG_NAMESPACES
QCOM_SOONG_NAMESPACE ?= hardware/qcom-caf/$(QCOM_HARDWARE_VARIANT)
PRODUCT_SOONG_NAMESPACES += $(QCOM_SOONG_NAMESPACE)

# Define kernel headers location
PRODUCT_VENDOR_KERNEL_HEADERS += hardware/qcom-caf/$(QCOM_HARDWARE_VARIANT)/kernel-headers

# Add bootctrl to PRODUCT_SOONG_NAMESPACES
PRODUCT_SOONG_NAMESPACES += hardware/qcom-caf/bootctrl

# Add display-commonsys-intf to PRODUCT_SOONG_NAMESPACES for QSSI supported platforms
ifeq ($(call is-board-platform-in-list, $(QSSI_SUPPORTED_PLATFORMS)),true)
PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys-intf/display
endif

# Add display-commonsys and display for non-GKI platforms
ifneq ($(filter $(UM_NO_GKI_PLATFORMS),$(PRODUCT_BOARD_PLATFORM)),)
PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/commonsys/display
endif

# Pass kernel version to Display HAL
ifneq ($(TARGET_KERNEL_VERSION),)
    SOONG_CONFIG_qtidisplay_target_kernel_version := $(TARGET_KERNEL_VERSION)
endif

# Add data-ipa-cfg-mgr to PRODUCT_SOONG_NAMESPACES if needed
ifneq ($(USE_DEVICE_SPECIFIC_DATA_IPA_CFG_MGR),true)
ifneq ($(filter $(UM_NO_GKI_PLATFORMS),$(PRODUCT_BOARD_PLATFORM)),)
    PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/data-ipa-cfg-mgr-nogki
else ifneq ($(filter $(UM_5_10_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    PRODUCT_SOONG_NAMESPACES += hardware/qcom-caf/sm8450/data-ipa-cfg-mgr
else ifneq ($(filter $(UM_5_15_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    PRODUCT_SOONG_NAMESPACES += hardware/qcom-caf/sm8550/data-ipa-cfg-mgr
else ifneq ($(filter $(UM_6_1_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    PRODUCT_SOONG_NAMESPACES += hardware/qcom-caf/sm8650/data-ipa-cfg-mgr
else ifneq ($(filter $(UM_6_6_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    PRODUCT_SOONG_NAMESPACES += hardware/qcom-caf/sm8750/data-ipa-cfg-mgr
endif
endif

# Add dataservices to PRODUCT_SOONG_NAMESPACES if needed
ifneq ($(USE_DEVICE_SPECIFIC_DATASERVICES),true)
    PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/dataservices
endif

# Add nxp opensource to PRODUCT_SOONG_NAMESPACES if needed
ifeq ($(USE_NQ_NFC),true)
    PRODUCT_SOONG_NAMESPACES += vendor/nxp/opensource
endif

# Add thermal HAL to PRODUCT_SOONG_NAMESPACES
ifneq ($(filter $(UM_6_6_FAMILY),$(TARGET_BOARD_PLATFORM)),)
    PRODUCT_SOONG_NAMESPACES += hardware/qcom-caf/thermal
else
    PRODUCT_SOONG_NAMESPACES += hardware/qcom-caf/thermal-legacy-um
endif

# Add wlan to PRODUCT_SOONG_NAMESPACES
PRODUCT_SOONG_NAMESPACES += \
    hardware/qcom-caf/wlan \
    hardware/qcom-caf/wlan/qcwcn

# Verified Boot
BOARD_AVB_SYSTEM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_SYSTEM_DLKM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_SYSTEM_EXT_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_SYSTEM_OTHER_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_ODM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_ODM_DLKM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_PRODUCT_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_VENDOR_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_VENDOR_DLKM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256

include hardware/qcom-caf/common/build/core/qcom_target.mk
