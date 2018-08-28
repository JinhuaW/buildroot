################################################################################
#
# TARGET_TEST_APPS
#
################################################################################

TARGET_TEST_APPS_VERSION = 8534462d763bdfb78cb3dc082bad97945da041c8
TARGET_TEST_APPS_SITE = https://github.com/JinhuaW/target-test-apps.git 
TARGET_TEST_APPS_SITE_METHOD = git

TARGET_TEST_APPS_DEPENDENCIES = 

TARGET_TEST_APPS_MAKE_OPTS += DESTDIR?=$(TARGET_DIR)/usr/bin/

define TARGET_TEST_APPS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_TEST_APPS_MAKE_OPTS) -C $(@D) build
endef

define TARGET_TEST_APPS_INSTALL_TARGET_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_TEST_APPS_MAKE_OPTS) -C $(@D) install
endef


$(eval $(generic-package))
