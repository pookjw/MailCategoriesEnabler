FINALPACKAGE=1
TARGET := iphone:clang:latest
INSTALL_TARGET_PROCESSES = MobileMail
THEOS_PACKAGE_SCHEME = rootless
export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MailCategoriesEnabler
$(TWEAK_NAME)_CFLAGS = -fno-objc-arc -fobjc-weak -Wno-module-import-in-extern-c -std=c++2b
$(TWEAK_NAME)_FRAMEWORKS = Foundation
$(TWEAK_NAME)_FILES = init.mm

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/tool.mk
