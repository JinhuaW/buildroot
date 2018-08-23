################################################################################
#
# LINUX_DRIVERS
#
################################################################################

LINUX_DRIVERS_VERSION = f16bbc692ee628e1aa62f5ef9495bdaeb0be5f2a
LINUX_DRIVERS_SITE = https://github.com/JinhuaW/linux-drivers.git
LINUX_DRIVERS_SITE_METHOD = git
LINUX_DRIVERS_INSTALL_MOD_DIR = spe
LINUX_DRIVERS_DEPENDENCIES = linux
LINUX_DRIVERS_LICENSE = CPLv2
LINUX_DRIVERS_LICENSE_FILES = COPYING
LINUX_DRIVERS_INSTALL_STAGING = YES

LINUX_DRIVERS_MAKE_OPTS +=

define LINUX_DRIVERS_BUILD_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules \
		$(LINUX_DRIVERS_MAKE_OPTS) \
		KBUILD_EXTRA_SYMBOLS=$(LINUX_DRIVERS_EXTRA_SYMBOLS)
endef

define LINUX_DRIVERS_INSTALL_TARGET_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install \
		INSTALL_MOD_STRIP=1 \
		INSTALL_MOD_DIR=$(LINUX_DRIVERS_INSTALL_MOD_DIR) \
		$(LINUX_DRIVERS_MAKE_OPTS)
endef

define LINUX_DRIVERS_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) headers_install \
		DESTDIR=$(STAGING_DIR) \
		$(LINUX_DRIVERS_MAKE_OPTS)
endef

$(eval $(generic-package))
