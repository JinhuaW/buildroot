################################################################################
#
# TARGET_TEST_APPS
#
################################################################################

TARGET_TEST_APPS_VERSION = 2f3c3341c31ba2c2476e8f739a056e37d6d6934a
TARGET_TEST_APPS_SITE = https://github.com/JinhuaW/target-test-apps.git 
TARGET_TEST_APPS_SITE_METHOD = git

TARGET_TEST_APPS_DEPENDENCIES = 

TARGET_TEST_APPS_MAKE_OPTS += DESTDIR?=$(TARGET_DIR)/usr/bin/test_apps

define TARGET_TEST_APPS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_TEST_APPS_MAKE_OPTS) -C $(@D) build
endef

define TARGET_TEST_APPS_INSTALL_TARGET_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_TEST_APPS_MAKE_OPTS) -C $(@D) install
endef


$(eval $(generic-package))
