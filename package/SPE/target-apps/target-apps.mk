################################################################################
#
# TARGET_APPS
#
################################################################################

TARGET_APPS_VERSION = ab172f34065ce1d23768759c22d8c0ea54f36dd3
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
