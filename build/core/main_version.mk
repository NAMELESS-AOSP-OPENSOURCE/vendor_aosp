# Versioning System
CUSTOM_PLATFORM_RELEASE_OR_CODENAME := 12L

# Build fingerprint
ifeq ($(BUILD_FINGERPRINT),)
BUILD_NUMBER_CUSTOM := $(shell date -u +%H%M)
CUSTOM_DEVICE ?= $(TARGET_DEVICE)
ifneq ($(filter Official,$(CUSTOM_BUILD_TYPE)),)
BUILD_SIGNATURE_KEYS := release-keys
else
BUILD_SIGNATURE_KEYS := test-keys
endif
BUILD_FINGERPRINT := $(PRODUCT_BRAND)/$(CUSTOM_DEVICE)/$(CUSTOM_DEVICE):$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_NUMBER_CUSTOM):$(TARGET_BUILD_VARIANT)/$(BUILD_SIGNATURE_KEYS)
endif
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)

# Versioning props
ADDITIONAL_SYSTEM_PROPERTIES  += \
    ro.nameless.version=$(CUSTOM_VERSION_PROP) \
    ro.nameless.version.display=$(CUSTOM_VERSION) \
    ro.nameless.build_date=$(CUSTOM_BUILD_DATE) \
    ro.nameless.build_date_utc=$(CUSTOM_BUILD_DATE_UTC) \
    ro.nameless.build_type=$(CUSTOM_BUILD_TYPE) \
    ro.nameless.settings.android_version=$(CUSTOM_PLATFORM_RELEASE_OR_CODENAME)
