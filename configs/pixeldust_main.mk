# Copyright (C) 2018-2019 The PixelDust Project
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

# Include overlays
DEVICE_PACKAGE_OVERLAYS += \
    vendor/pixeldust/overlay \
    vendor/pixeldust/packages/overlays/Common

# Include needed privapp permissions whitelist
PRODUCT_COPY_FILES += vendor/pixeldust/prebuilt/etc/privapp-permissions/pixeldust-permissions.xml:system/etc/permissions/pixeldust-permissions.xml
PRODUCT_COPY_FILES += vendor/pixeldust/prebuilt/etc/privapp-permissions/pixeldust-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/pixeldust-permissions.xml

# Filesystem
TARGET_FS_CONFIG_GEN += vendor/pixeldust/config/config.fs

# Copy all init rc files
$(foreach f,$(wildcard vendor/pixeldust/prebuilt/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):system/etc/init/$(notdir $f)))
