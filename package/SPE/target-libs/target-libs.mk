################################################################################
#
# TARGET_LIBS
#
################################################################################

TARGET_LIBS_VERSION = b46a8a82489a27d0bfceed338b02d4748d94a34b
TARGET_LIBS_SITE = https://github.com/JinhuaW/target-libs.git 
TARGET_LIBS_SITE_METHOD = git
TARGET_LIBS_INSTALL_STAGING = YES

TARGET_LIBS_DEPENDENCIES =

TARGET_LIBS_MAKE_OPTS += DESTDIR?=$(TARGET_DIR)

ifeq ($(BR2_PACKAGE_TARGET_LIBS_THREAD_POOL),y)
TARGET_LIBS_BUILD_TARGETS += build_thread_pool
TARGET_LIBS_INSTALL_TARGETS += install_thread_pool
endif

define TARGET_LIBS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_LIBS_MAKE_OPTS) -C $(@D) $(TARGET_LIBS_BUILD_TARGETS)
endef

define TARGET_LIBS_INSTALL_TARGET_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_LIBS_MAKE_OPTS) -C $(@D) $(TARGET_LIBS_INSTALL_TARGETS)
endef

define TARGET_LIBS_INSTALL_STAGING_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_LIBS_MAKE_OPTS) -C $(@D) $(TARGET_LIBS_INSTALL_TARGETS)
endef

$(eval $(generic-package))
