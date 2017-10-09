################################################################################
#
# TARGET_APPS
#
################################################################################

TARGET_APPS_VERSION = a25da9e475f1369ba0d0d5388cf0c3efb6783712
TARGET_APPS_SITE = https://github.com/JinhuaW/target-apps.git 
TARGET_APPS_SITE_METHOD = git

TARGET_APPS_DEPENDENCIES = libfuse

TARGET_APPS_MAKE_OPTS += DESTDIR?=$(TARGET_DIR)/usr/bin

define TARGET_APPS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_APPS_MAKE_OPTS) -C $(@D) build
endef

define TARGET_APPS_INSTALL_TARGET_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_APPS_MAKE_OPTS) -C $(@D) install
endef


$(eval $(generic-package))
