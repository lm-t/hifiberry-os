################################################################################
#
# audiocontrol2
#
################################################################################

AUDIOCONTROL2_VERSION = 807f8b93428ceecc65e1495bcd521d0532eb7877
AUDIOCONTROL2_SITE = $(call github,hifiberry,audiocontrol2,$(AUDIOCONTROL2_VERSION))

define AUDIOCONTROL2_BUILD_CMDS
endef

define AUDIOCONTROL2_INSTALL_TARGET_CMDS
        mkdir -p $(TARGET_DIR)/opt/audiocontrol2
        cp -rv $(@D)/* $(TARGET_DIR)/opt/audiocontrol2
	$(INSTALL) -D -m 0755 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/audiocontrol2/audiocontrol2.conf \
		$(TARGET_DIR)/etc
endef

define AUDIOCONTROL2_INSTALL_INIT_SYSTEMD
    $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/audiocontrol2/audiocontrol2.service \
           $(TARGET_DIR)/usr/lib/systemd/system/audiocontrol2.service
    ln -fs ../../../../usr/lib/systemd/system/audiocontrol2.service \
           $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/audiocontrol2.service
endef

$(eval $(generic-package))