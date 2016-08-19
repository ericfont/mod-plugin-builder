######################################
#
# mod-distortion
#
######################################

MOD_DISTORTION_VERSION = 30fb491e43917b4653d8007597ca3e76afe9edd6
MOD_DISTORTION_SITE = $(call github,moddevices,mod-distortion,$(MOD_DISTORTION_VERSION))
MOD_DISTORTION_BUNDLES = mod-bigmuff.lv2 mod-ds1.lv2

MOD_DISTORTION_TARGET_MAKE = $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) NOOPT=true -C $(@D)

define MOD_DISTORTION_BUILD_CMDS
	$(MOD_DISTORTION_TARGET_MAKE)
endef

define MOD_DISTORTION_INSTALL_TARGET_CMDS
	$(MOD_DISTORTION_TARGET_MAKE) install DESTDIR=$(TARGET_DIR) INSTALL_PATH=/usr/lib/lv2
	cp -rL $($(PKG)_PKGDIR)/mod-bigmuff.lv2/* $(TARGET_DIR)/usr/lib/lv2/mod-bigmuff.lv2/
	cp -rL $($(PKG)_PKGDIR)/mod-ds1.lv2/*     $(TARGET_DIR)/usr/lib/lv2/mod-ds1.lv2/
endef

$(eval $(generic-package))
