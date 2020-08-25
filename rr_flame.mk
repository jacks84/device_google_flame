# Copyright (C) 2018-2020 RR
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for an aosp Android
# build for marlin hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and du, hence its name.
#

#Use floral native Face Unlock
TARGET_DISABLE_ALTERNATIVE_FACE_UNLOCK := true

TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

# Include RR common configuration
include vendor/rr/config/common_full_phone.mk

# Inherit from those products. Most specific first.
$(call inherit-product, device/google/coral/aosp_flame.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit PixelGApps
$(call inherit-product, vendor/pixelgapps/pixel-gapps.mk)

include device/google/coral/device-rr.mk

RR_BUILDTYPE := Official

PRODUCT_NAME := rr_flame
PRODUCT_DEVICE := flame
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 4
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="flame" \
    PRODUCT_DEVICE="flame" \
    PRIVATE_BUILD_DESC="flame-user 10 QQ3A.200805.001 6578210 release-keys"

BUILD_FINGERPRINT := "google/flame/flame:10/QQ3A.200805.001/6578210:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/flame/flame:10/QQ3A.200805.001/6578210:user/release-keys

$(call inherit-product-if-exists, vendor/google/flame/flame-vendor.mk)
$(call inherit-product-if-exists, vendor/google/psu/google-psu.mk)
